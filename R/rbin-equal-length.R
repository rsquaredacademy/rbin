#' Equal length binning
#'
#' Bin continuous data using the equal length binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_equal_length}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' bins <- rbin_equal_length(mbank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#'
#' @export
#'
rbin_equal_length <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) UseMethod("rbin_equal_length")

#' @export
#'
rbin_equal_length.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) {

  resp <- deparse(substitute(response))
  pred <- deparse(substitute(predictor))

  var_names <- names(data[, c(resp, pred)])
  prep_data <- data[, c(resp, pred)]

  if (include_na) {
    bm <- prep_data
  } else {
    bm <- na.omit(prep_data)
  }

  colnames(bm) <- c("response", "predictor")

  bm$bin    <- NA
  byd       <- bm$predictor
  l_freq    <- el_freq(byd, bins)
  u_freq    <- eu_freq(byd, bins)

  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }

  k         <- bin_create(bm)
  sym_sign  <- c(rep("<", (bins - 1)), ">=")
  fbin2     <- f_bin(u_freq)
  intervals <- create_intervals(sym_sign, fbin2)

 if (include_na) {

    na_present <- nrow(k) > bins

    if (na_present) {
      intervals <- rbind(intervals, cut_point = 'NA')
    }

  }

  result <- list(bins      = cbind(intervals, k),
                 method    = "Equal Length",
                 vars      = var_names,
                 lower_cut = l_freq,
                 upper_cut = u_freq)

  class(result) <- c("rbin_equal_length")
  return(result)

}


#' @export
#'
print.rbin_equal_length <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  print(x$bins[c('cut_point', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')])

}

#' @rdname rbin_equal_length
#' @export
#'
plot.rbin_equal_length <- function(x, print_plot = TRUE, ...) {

  p <- plot_bins(x)

  if (print_plot) {
    print(p)
  }

  invisible(p)

}

el_freq <- function(byd, bins) {

  bin_length <- (max(byd, na.rm = TRUE) - min(byd, na.rm = TRUE)) / bins
  append(min(byd, na.rm = TRUE), min(byd, na.rm = TRUE) + (bin_length * seq_len(bins)))[1:bins]

}

eu_freq <- function(byd, bins) {

  bin_length <- (max(byd, na.rm = TRUE) - min(byd, na.rm = TRUE)) / bins
  ufreq      <- min(byd, na.rm = TRUE) + (bin_length * seq_len(bins))
  n          <- length(ufreq)
  ufreq[n]   <- max(byd, na.rm = TRUE) + 1
  return(ufreq)

}
