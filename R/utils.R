#' @importFrom data.table data.table .N
#' @importFrom stats quantile
#' @importFrom utils head tail

# Drop rows with a missing response, warning about how many were removed
drop_na_response <- function(data) {

  n_na <- sum(is.na(data$response))

  if (n_na > 0) {
    warning(sprintf("Dropping %d row%s with missing response.",
                    n_na, if (n_na == 1) "" else "s"), call. = FALSE)
    data <- data[!is.na(data$response), , drop = FALSE]
  }

  data

}

# Validate the response and return it coded as 0/1.
#
# The documented contract is a binary response: 0/1 (or logical), or a
# two-level factor/character. For a two-level factor the first level is treated
# as 0 and the second as 1; character values are sorted in C-locale order and the
# second one is treated as 1. Anything else is rejected instead of silently
# producing zero class counts.
validate_response <- function(response) {

  if (is.factor(response)) {

    values  <- as.character(response)
    levs    <- levels(response)
    levs    <- levs[!is.na(levs)]
    # A declared binary factor keeps its coding in a one-class subset. For
    # factors with extra unused levels, retain the two observed classes.
    if (length(levs) != 2L) {
      levs <- levs[levs %in% values[!is.na(values)]]
    }

    if (length(levs) != 2L) {
      stop("response must be binary; the factor has ", length(levs),
           " level(s) present", call. = FALSE)
    }

    return(as.integer(values == levs[2L]))
  }

  if (is.character(response)) {

    present <- sort(unique(response[!is.na(response)]), method = "radix")

    if (length(present) != 2L) {
      stop("response must be binary; the character vector has ",
           length(present), " unique value(s) present", call. = FALSE)
    }

    return(as.integer(response == present[2L]))
  }

  if (is.logical(response)) {
    return(as.integer(response))
  }

  if (is.numeric(response)) {

    invalid <- unique(response[!is.na(response) & !(response %in% c(0, 1))])

    if (length(invalid) > 0L) {
      stop("response must be binary (0/1); found value(s): ",
           paste(head(invalid, 5L), collapse = ", "), call. = FALSE)
    }

    return(as.integer(response))
  }

  stop("response must be numeric, logical, or a two-level factor/character",
       call. = FALSE)

}

# Extract the response/predictor columns, validate the response and drop rows
# with a missing response. Returns a data.frame with columns response and
# predictor.
prep_binning_data <- function(data, response, predictor) {

  if (is.null(data)) {
    stop("`data` must be a data.frame", call. = FALSE)
  }

  data <- as.data.frame(data)

  if (!is.character(response) || length(response) != 1L || is.na(response)) {
    stop("`response` must be the name of a column in `data`", call. = FALSE)
  }

  if (!is.character(predictor) || length(predictor) != 1L || is.na(predictor)) {
    stop("`predictor` must be the name of a column in `data`", call. = FALSE)
  }

  if (identical(response, predictor)) {
    stop("`response` and `predictor` must be different columns", call. = FALSE)
  }

  if (!response %in% names(data)) {
    stop("response variable '", response, "' not found in data", call. = FALSE)
  }

  if (!predictor %in% names(data)) {
    stop("predictor variable '", predictor, "' not found in data",
         call. = FALSE)
  }

  prep_data <- data.frame(response  = data[[response]],
                          predictor = data[[predictor]])

  prep_data$predictor <- strip_asis(prep_data$predictor)
  check_predictor_class(prep_data$predictor, categorical = TRUE)
  prep_data$response <- validate_response(prep_data$response)
  prep_data          <- drop_na_response(prep_data)

  if (nrow(prep_data) == 0L) {
    stop("no observations with a non-missing response", call. = FALSE)
  }

  prep_data

}

strip_asis <- function(x) {
  if (inherits(x, "AsIs")) class(x) <- setdiff(class(x), "AsIs")
  x
}

check_predictor_class <- function(x, categorical = FALSE, scorer = FALSE) {

  if (inherits(x, "integer64")) {
    stop("unsupported predictor class '", paste(class(x), collapse = "/"),
         "'; use as.numeric() when values are within +/-2^53",
         call. = FALSE)
  }

  if (!categorical && (is.factor(x) || inherits(x, c("Date", "POSIXt")))) {
    stop("predictor must be a numeric variable for this binning method; use ",
         if (scorer) "rbin_factor_create()" else "rbin_factor()",
         " for categorical predictors", call. = FALSE)
  }

  # difftime carries units that change with the data (secs/mins/hours/days),
  # so unitless cut points can't be applied safely at scoring time
  if (!categorical && inherits(x, "difftime")) {
    stop("difftime predictors are not supported by the numeric binning methods; ",
         "convert with as.numeric(x, units = \"days\") (or another fixed unit) first",
         call. = FALSE)
  }

  if (!categorical && is.object(x) &&
      typeof(x) %in% c("integer", "double") && !inherits(x, "difftime")) {
    stop("unsupported predictor class '", paste(class(x), collapse = "/"),
         "'", call. = FALSE)
  }

}

check_numeric_predictor <- function(prep_data) {

  check_predictor_class(prep_data$predictor)

  if (!is.numeric(prep_data$predictor) && !inherits(prep_data$predictor, "difftime")) {
    stop("predictor must be a numeric variable for this binning method; use rbin_factor() for categorical predictors",
         call. = FALSE)
  }

}

# Resolve a column argument that may be supplied either as a bare column name
# or as a character value (as the addins and programmatic calls do).
column_name <- function(expr, env, data) {

  if (is.character(expr) && length(expr) == 1L && !is.na(expr) && nzchar(expr)) {
    return(expr)
  }

  name <- if (is.symbol(expr)) as.character(expr) else deparse(expr)

  if (length(name) == 1L && isTRUE(name %in% names(data))) {
    return(name)
  }

  value <- tryCatch(eval(expr, env), error = function(e) NULL)

  if (is.character(value) && length(value) == 1L && !is.na(value) &&
      nzchar(value)) {
    return(value)
  }

  name

}

# Keep or remove rows with a missing predictor depending on include_na.
keep_na_rows <- function(prep_data, include_na) {

  if (include_na) {
    bm <- prep_data
  } else {
    bm <- prep_data[!is.na(prep_data$predictor), , drop = FALSE]
  }

  if (nrow(bm) == 0L) {
    stop("no observations with a non-missing predictor", call. = FALSE)
  }

  bm

}

# Integer bin ID for a numeric predictor. Intervals are [lower, upper) except
# for the last interval which is unbounded on the right. This avoids relying on
# max(x) + 1 being larger than max(x) in floating point and keeps empty
# intervals identifiable instead of silently recycling rows.
numeric_bin_id <- function(x, lower, upper) {

  if (anyNA(lower) || anyNA(upper)) {
    stop("computed cut points contain NA or NaN; cannot form numeric bins",
         call. = FALSE)
  }

  n   <- length(lower)
  out <- rep(NA_integer_, length(x))

  if (n == 0L) {
    if (any(!is.na(x))) {
      stop("non-missing predictor values fall outside the bin intervals",
           call. = FALSE)
    }
    return(out)
  }

  if (n > 1L) {
    for (i in seq_len(n - 1L)) {
      out[which(x >= lower[i] & x < upper[i])] <- i
    }
  }

  out[which(x >= lower[n])] <- n

  if (any(!is.na(x) & is.na(out))) {
    stop("non-missing predictor values fall outside the bin intervals",
         call. = FALSE)
  }

  out

}

# Entropy contribution of each bin using the 0 log 0 = 0 convention. Bins
# without observations contribute zero.
entropy_bin <- function(good, bad, n) {

  out <- numeric(length(n))
  ok  <- !is.na(n) & n > 0

  if (any(ok)) {

    pg <- good[ok] / n[ok]
    pb <- bad[ok] / n[ok]
    e  <- numeric(length(pg))

    i <- pg > 0
    e[i] <- e[i] - pg[i] * log2(pg[i])

    j <- pb > 0
    e[j] <- e[j] - pb[j] * log2(pb[j])

    out[ok] <- e

  }

  out

}

# Summarise a response by bin ID. `ids` holds every requested bin, so empty
# intervals are kept with zero counts instead of being dropped and recycled.
summarise_bins <- function(response, bin, ids) {

  agg <- data.table(bin = bin, response = response)[
    , list(bin_count = .N,
           good      = sum(response == 1L),
           bad       = sum(response == 0L)),
    by = list(bin)
  ]

  m <- match(ids, agg$bin)

  out <- data.frame(
    bin       = ids,
    bin_count = as.integer(ifelse(is.na(m), 0L, agg$bin_count[m])),
    good      = as.integer(ifelse(is.na(m), 0L, agg$good[m])),
    bad       = as.integer(ifelse(is.na(m), 0L, agg$bad[m]))
  )

  out$bin_cum_count  <- cumsum(out$bin_count)
  out$good_cum_count <- cumsum(out$good)
  out$bad_cum_count  <- cumsum(out$bad)
  out$bin_prop       <- out$bin_count / sum(out$bin_count)
  out$good_rate      <- out$good / out$bin_count
  out$bad_rate       <- out$bad / out$bin_count

  sum_good <- sum(out$good)
  sum_bad  <- sum(out$bad)

  out$good_dist <- if (sum_good > 0) out$good / sum_good else NA_real_
  out$bad_dist  <- if (sum_bad > 0) out$bad / sum_bad else NA_real_
  out$woe       <- log(out$bad_dist / out$good_dist)
  out$dist_diff <- out$bad_dist - out$good_dist
  out$iv        <- out$dist_diff * out$woe
  out$entropy   <- entropy_bin(out$good, out$bad, out$bin_count)
  out$prop_entropy <- out$bin_prop * out$entropy

  # an empty interval has no rates, distributions or WoE, and contributes
  # nothing to IV or entropy
  empty <- out$bin_count == 0L

  out$good_rate[empty]      <- NA_real_
  out$bad_rate[empty]       <- NA_real_
  out$good_dist[empty]      <- 0
  out$bad_dist[empty]       <- 0
  out$woe[empty]            <- NA_real_
  out$dist_diff[empty]      <- 0
  out$iv[empty]             <- 0
  out$entropy[empty]        <- 0
  out$prop_entropy[empty]   <- 0

  out

}

check_bins <- function(bins) validate_bins(bins, 2L)

validate_bins <- function(bins, minimum = 2L) {

  if (length(bins) != 1L || !is.numeric(bins) || is.na(bins)) {
    stop("bins must be a single number", call. = FALSE)
  }

  if (!is.finite(bins) || bins > .Machine$integer.max || bins != trunc(bins)) {
    stop("bins must be a whole number", call. = FALSE)
  }

  if (bins < minimum) {
    stop(paste0("bins must be at least ", minimum), call. = FALSE)
  }

  as.integer(bins)

}

f_bin <- function(u_freq) {

  len_fbin <- length(u_freq)
  fbin     <- u_freq[-len_fbin]
  l_fbin   <- length(fbin)
  c(fbin, fbin[l_fbin])

}

# Format interval boundaries for display. Distinct values that print
# identically (for example 1 and 1 + 1e-15) are formatted with full precision so
# that distinct bins never share a label or a dummy variable name. Repeated
# boundaries are left alone.
format_boundaries <- function(x) {

  short <- as.character(x)
  full  <- vapply(x, function(value) {
    format(value, digits = 17, trim = TRUE)
  }, character(1))

  out <- short

  for (value in unique(short)) {
    idx <- which(short == value)
    if (length(unique(full[idx])) > 1L) {
      out[idx] <- full[idx]
    }
  }

  out

}

create_intervals <- function(sym_sign, fbin2) {

  values            <- format_boundaries(fbin2)
  result            <- data.frame(sym_sign, fbin2)
  result$cut_point  <- paste(result$sym_sign, values)
  result['cut_point']

}

plot_bins <- function(x) {

  plot_data <- x$bins
  positions <- seq_len(nrow(plot_data))

  if (!is.null(plot_data$cut_point)) {
    labels <- as.character(plot_data$cut_point)
  } else if (!is.null(plot_data$lower_cut)) {
    labels <- paste0(plot_data$lower_cut, "-", plot_data$upper_cut)
    labels[is.na(plot_data$lower_cut) & is.na(plot_data$upper_cut)] <- "NA"
  } else {
    labels <- as.character(positions)
  }

  p <-
    ggplot(data = plot_data) +
    geom_line(aes(x = positions, y = woe), color = "blue") +
    geom_point(aes(x = positions, y = woe), color = "red") +
    xlab("Bins") + ylab("WoE") + ggtitle("WoE Trend") +
    scale_x_continuous(breaks = positions, labels = labels)

  return(p)

}


check_suggests <- function(pkg) {

  pkg_flag <- tryCatch(utils::packageVersion(pkg), error = function(e) NA)

  if (is.na(pkg_flag)) {

    msg <- message(paste0('\n', pkg, ' must be installed for this functionality.'))

    if (interactive()) {
      message(msg, "\nWould you like to install it?")
      if (utils::menu(c("Yes", "No")) == 1) {
        utils::install.packages(pkg)
      } else {
        stop(msg, call. = FALSE)
      }
    } else {
      stop(msg, call. = FALSE)
    }
  }

}

#' @importFrom stats quantile
winsor <- function(x, min_val = NULL, max_val = NULL, probs = c(0.05, 0.95),
                   na.rm = TRUE, type = 7) {

  if (is.null(min_val) || is.null(max_val)) {

    # nothing to estimate from when every value is missing
    if (all(is.na(x))) {
      return(x)
    }

  }

  if (is.null(min_val)) {
    min_val <- unname(quantile(x, probs = probs[1L], type = type, na.rm = na.rm))
  }

  if (is.null(max_val)) {
    max_val <- unname(quantile(x, probs = probs[2L], type = type, na.rm = na.rm))
  }

  if (is.na(min_val) || is.na(max_val) || min_val > max_val) {
    stop("`min_val` must be less than or equal to `max_val`", call. = FALSE)
  }

  out <- pmin(pmax(x, min_val), max_val)
  attr(out, "clamp") <- c(min = min_val, max = max_val)
  out

}

try_pkg <- function(pkg) {
  tryCatch(packageVersion(pkg), error = function(e) NA)
}
