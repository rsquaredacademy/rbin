#' Manual binning
#'
#' Bin continuous data manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param cut_points Cut points for binning.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_manual}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @details Specify the upper open interval for each bin. `rbin`
#'   follows the left closed and right open interval. If you want to create_bins
#'   10 bins, the app will show you only 9 input boxes. The interval for the 10th bin
#'   is automatically computed. For example, if you want the first bin to have all the
#'   values between the minimum and including 36, then you will enter the value 37.
#'
#' @examples
#' bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL, include_na = TRUE) UseMethod("rbin_manual")

#' @export
#'
rbin_manual.default <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL, include_na = TRUE) {

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
  l_freq    <- append(min(byd, na.rm = TRUE), cut_points)
  u_freq    <- c(cut_points, (max(byd, na.rm = TRUE) + 1))
  bins      <- length(cut_points) + 1

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
                 method = "Manual",
                 vars = var_names,
                 lower_cut = l_freq,
                 upper_cut = u_freq)

  class(result) <- c("rbin_manual", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_manual <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  print(x$bins[c('cut_point', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')])
}

#' @rdname rbin_manual
#' @export
#'
plot.rbin_manual <- function(x, print_plot = TRUE, ...) {

  p <- plot_bins(x)

  if (print_plot) {
    print(p)
  }

  return(p)

}
