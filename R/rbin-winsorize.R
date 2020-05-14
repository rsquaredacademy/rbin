#' Winsorized binning
#'
#' Bin continuous data using winsorized method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param winsor_rate A value from 0.0 to 0.5.
#' @param min_val the low border, all values being lower than this will be replaced by this value. The default is set to the 5 percent quantile of predictor.
#' @param max_val the high border, all values being larger than this will be replaced by this value. The default is set to the 95 percent quantile of predictor.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param remove_na logical; if \code{TRUE} NAs will removed while calculating quantiles
#' @param type an integer between 1 and 9 selecting one of the nine quantile algorithms detailed in \code{quantile()} to be used.
#' @param x An object of class \code{rbin_winsorize}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' bins <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @export
#'
rbin_winsorize <- function(data = NULL, response = NULL, predictor = NULL,
                                   bins = 10, include_na = TRUE, winsor_rate = 0.05,
                                   min_val = NULL, max_val = NULL, type = 7,
                                   remove_na = TRUE) UseMethod("rbin_winsorize")


#' @export
#'
rbin_winsorize.default <- function(data = NULL, response = NULL, predictor = NULL,
                                   bins = 10, include_na = TRUE, winsor_rate = 0.05,
                                   min_val = NULL, max_val = NULL, type = 7,
                                   remove_na = TRUE) {

  resp <- deparse(substitute(response))
  pred <- deparse(substitute(predictor))

  probs_min <- 0 + winsor_rate
  probs_max <- 1 - winsor_rate

  var_names <- names(data[, c(resp, pred)])
  prep_data <- data[, c(resp, pred)]
  colnames(prep_data) <- c("response", "predictor")

  if (include_na) {
    bm_data <- prep_data
  } else {
    bm_data <- na.omit(prep_data)
  }

  bm_data$predictor2 <- winsor(
    x       = prep_data$predictor,
    min_val = min_val,
    max_val = max_val,
    probs   = c(probs_min, probs_max),
    na.rm   = remove_na,
    type    = type)

  bm <- bm_data[c('response', 'predictor2')]
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

  result <- list(bins = cbind(intervals, k),
                 method = "Winsorize",
                 vars = var_names,
                 lower_cut = l_freq,
                 upper_cut = u_freq)

  class(result) <- c("rbin_winsorize")
  return(result)

}


#' @export
#'
print.rbin_winsorize <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  print(x$bins[c('cut_point', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')])
}

#' @rdname rbin_winsorize
#' @export
#'
plot.rbin_winsorize <- function(x, print_plot = TRUE, ...) {

  p <- plot_bins(x)

  if (print_plot) {
    print(p)
  }

  invisible(p)

}
