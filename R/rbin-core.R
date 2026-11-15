# Shared implementation of every binning method.
#
# The exported functions and the RStudio addins both call these workers, so
# input validation, missing-value handling, the summary statistics and the
# layout of the bins table cannot drift apart.

build_numeric_bins <- function(bm, lower, upper, method, class_name, var_names) {

  bin      <- numeric_bin_id(bm$predictor, lower, upper)
  ids      <- seq_along(lower)
  na_group <- anyNA(bin)

  if (na_group) {
    ids <- c(ids, NA_integer_)
  }

  k <- summarise_bins(bm$response, bin, ids)

  sym_sign  <- c(rep("<", length(lower) - 1L), ">=")
  fbin2     <- f_bin(upper)
  intervals <- create_intervals(sym_sign, fbin2)
  cut_point <- as.character(intervals$cut_point)

  if (na_group) {
    cut_point <- c(cut_point, "NA")
  }

  result <- list(bins      = cbind(cut_point = cut_point, k),
                 method    = method,
                 vars      = var_names,
                 lower_cut = lower,
                 upper_cut = upper)

  class(result) <- class_name

  result

}

# Bins table when the predictor has no non-missing values at all but the
# missing values themselves form a valid group.
build_na_bins <- function(bm, method, class_name, var_names) {

  bin <- rep(NA_integer_, nrow(bm))
  k   <- summarise_bins(bm$response, bin, NA_integer_)

  result <- list(bins      = cbind(cut_point = "NA", k),
                 method    = method,
                 vars      = var_names,
                 lower_cut = numeric(0),
                 upper_cut = numeric(0))

  class(result) <- class_name

  result

}

min_finite <- function(x) {
  if (any(!is.na(x))) min(x, na.rm = TRUE) else -Inf
}

max_finite <- function(x) {
  if (any(!is.na(x))) max(x, na.rm = TRUE) else 0
}

rbin_manual_impl <- function(data, response, predictor, cut_points = NULL,
                             include_na = TRUE) {

  prep_data <- prep_binning_data(data, response, predictor)
  check_numeric_predictor(prep_data)

  if (is.null(cut_points) || !is.numeric(cut_points) ||
      length(cut_points) < 1L || anyNA(cut_points)) {
    stop("cut_points must be a numeric vector of cut points", call. = FALSE)
  }

  if (is.unsorted(cut_points)) {
    stop("cut_points must be sorted in increasing order", call. = FALSE)
  }

  bm     <- keep_na_rows(prep_data, include_na)
  byd    <- bm$predictor
  l_freq <- c(min_finite(byd), cut_points)
  u_freq <- c(cut_points, max_finite(byd) + 1)

  build_numeric_bins(bm, l_freq, u_freq, "Manual", "rbin_manual",
                     c(response, predictor))

}

rbin_equal_length_impl <- function(data, response, predictor, bins = 10,
                                   include_na = TRUE) {

  prep_data <- prep_binning_data(data, response, predictor)
  check_numeric_predictor(prep_data)
  bins      <- check_bins(bins)
  bm        <- keep_na_rows(prep_data, include_na)
  byd       <- bm$predictor

  if (!any(!is.na(byd))) {

    if (!include_na) {
      stop("predictor has no non-missing values", call. = FALSE)
    }

    return(build_na_bins(bm, "Equal Length", "rbin_equal_length",
                         c(response, predictor)))
  }

  l_freq <- el_freq(byd, bins)
  u_freq <- eu_freq(byd, bins)

  build_numeric_bins(bm, l_freq, u_freq, "Equal Length", "rbin_equal_length",
                     c(response, predictor))

}

rbin_quantiles_impl <- function(data, response, predictor, bins = 10,
                                include_na = TRUE) {

  prep_data <- prep_binning_data(data, response, predictor)
  check_numeric_predictor(prep_data)
  bins      <- check_bins(bins)
  bm        <- keep_na_rows(prep_data, include_na)
  byd       <- bm$predictor

  if (!any(!is.na(byd))) {

    if (!include_na) {
      stop("predictor has no non-missing values", call. = FALSE)
    }

    return(build_na_bins(bm, "Quantile", "rbin_quantiles",
                         c(response, predictor)))
  }

  l_freq <- ql_freq(byd, bins)
  u_freq <- qu_freq(byd, bins)

  build_numeric_bins(bm, l_freq, u_freq, "Quantile", "rbin_quantiles",
                     c(response, predictor))

}

rbin_winsorize_impl <- function(data, response, predictor, bins = 10,
                                include_na = TRUE, winsor_rate = 0.05,
                                min_val = NULL, max_val = NULL, type = 7,
                                remove_na = TRUE) {

  prep_data <- prep_binning_data(data, response, predictor)
  check_numeric_predictor(prep_data)
  bins      <- check_bins(bins)
  bm_data   <- keep_na_rows(prep_data, include_na)

  probs_min <- 0 + winsor_rate
  probs_max <- 1 - winsor_rate

  bm_data$predictor2 <- winsor(
    x       = bm_data$predictor,
    min_val = min_val,
    max_val = max_val,
    probs   = c(probs_min, probs_max),
    na.rm   = remove_na,
    type    = type)

  bm          <- bm_data[c('response', 'predictor2')]
  colnames(bm) <- c("response", "predictor")
  byd         <- bm$predictor

  if (!any(!is.na(byd))) {

    if (!include_na) {
      stop("predictor has no non-missing values", call. = FALSE)
    }

    return(build_na_bins(bm, "Winsorize", "rbin_winsorize",
                         c(response, predictor)))
  }

  l_freq <- el_freq(byd, bins)
  u_freq <- eu_freq(byd, bins)

  build_numeric_bins(bm, l_freq, u_freq, "Winsorize", "rbin_winsorize",
                     c(response, predictor))

}

equal_freq_sizes <- function(n, bins) {

  if (bins > n) {
    stop("bins must not exceed the number of observations", call. = FALSE)
  }

  base <- n %/% bins
  rem  <- n %% bins
  sizes <- rep(as.integer(base), bins)

  if (rem > 0L) {
    sizes[seq_len(rem)] <- sizes[seq_len(rem)] + 1L
  }

  sizes

}

rbin_equal_freq_impl <- function(data, response, predictor, bins = 10) {

  prep_data <- prep_binning_data(data, response, predictor)
  check_numeric_predictor(prep_data)
  bins      <- validate_bins(bins, 1L)

  bm  <- prep_data
  x   <- bm$predictor
  idx <- which(!is.na(x))

  if (length(idx) == 0L) {
    stop("predictor has no non-missing values", call. = FALSE)
  }

  sizes <- equal_freq_sizes(length(idx), bins)

  bin      <- rep(NA_integer_, nrow(bm))
  ord      <- idx[order(x[idx])]
  bin[ord] <- rep(seq_len(bins), sizes)

  ids      <- seq_len(bins)
  na_group <- anyNA(bin)

  if (na_group) {
    ids <- c(ids, NA_integer_)
  }

  k <- summarise_bins(bm$response, bin, ids)

  sorted_x <- x[ord]
  lower    <- cumsum(sizes) - sizes + 1L
  upper    <- cumsum(sizes)

  intervals <- data.frame(
    lower_cut = c(sorted_x[lower], if (na_group) NA_real_),
    upper_cut = c(sorted_x[upper], if (na_group) NA_real_)
  )

  result <- list(bins      = cbind(intervals, k),
                 method    = "Equal Frequency",
                 vars      = c(response, predictor),
                 lower_cut = lower,
                 upper_cut = upper)

  class(result) <- "rbin_equal_freq"

  result

}

rbin_factor_impl <- function(data, response, predictor, include_na = TRUE) {

  prep_data <- prep_binning_data(data, response, predictor)
  bm        <- keep_na_rows(prep_data, include_na)
  x         <- bm$predictor

  ids <- unique(x)

  if (is.factor(ids)) {
    values <- as.character(ids)
    if (anyNA(values)) {
      values <- c(values[!is.na(values)], NA)
    }
    ids <- factor(values, levels = levels(ids))
  } else if (anyNA(ids)) {
    ids <- c(ids[!is.na(ids)], NA)
  }

  k <- summarise_bins(bm$response, x, ids)
  names(k)[names(k) == "bin"] <- "level"

  result <- list(bins = k, method = "Custom", vars = c(response, predictor))

  class(result) <- "rbin_factor"

  result

}

rbin_factor_combine_impl <- function(data, var, new_var, new_name) {

  data <- as.data.frame(data)

  if (!is.character(var) || length(var) != 1L || is.na(var)) {
    stop("`var` must be the name of a column in `data`", call. = FALSE)
  }

  if (!var %in% names(data)) {
    stop("variable '", var, "' not found in data", call. = FALSE)
  }

  if (!is.character(new_name) || length(new_name) != 1L || is.na(new_name)) {
    stop("`new_name` must be a single character value", call. = FALSE)
  }

  mydata <- data[[var]]

  if (is.character(mydata)) {
    mydata <- factor(mydata)
  }

  if (!is.factor(mydata)) {
    stop("`var` must be a factor or character variable", call. = FALSE)
  }

  if (length(new_var) == 0L) {
    return(data)
  }

  selected <- as.character(new_var)

  current_lev <- levels(mydata)
  current_lev[current_lev %in% selected] <- new_name
  current_lev <- unique(current_lev)

  values            <- as.character(mydata)
  values[values %in% selected] <- new_name

  data[[var]] <- factor(values, levels = current_lev)

  data

}
