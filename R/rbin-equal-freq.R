#' Equal frequency binning
#'
#' Bin continuous data using the equal frequency binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable; a binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1; for character data the two
#'   values are sorted and the second is treated as 1. Rows with a missing
#'   response are dropped with a warning.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param x An object of class \code{rbin_equal_freq}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_equal_freq} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per group (plus a final row
#'   for missing values when present); \code{method}; \code{vars};
#'   \code{lower_cut}; and \code{upper_cut}.
#'
#' @details Groups differ in size by at most one observation. When missing
#'   predictor values are present they form a separate final group, and the
#'   equal frequency groups are built from the non-missing values only.
#'
#' @examples
#' bins <- rbin_equal_freq(mbank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @export
#'
rbin_equal_freq <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_freq")

#' @export
#'
rbin_equal_freq.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  rbin_equal_freq_impl(data      = data,
                       response  = deparse(substitute(response)),
                       predictor = deparse(substitute(predictor)),
                       bins      = bins)

}


#' @export
#'
print.rbin_equal_freq <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  print(x$bins[c('lower_cut', 'upper_cut', 'bin_count', 'good', 'bad', 'good_rate',
           'woe', 'iv', 'entropy')])

}

#' @rdname rbin_equal_freq
#' @export
#'
plot.rbin_equal_freq <- function(x, print_plot = TRUE, ...) {

  p <- plot_bins(x)

  if (print_plot) {
    print(p)
  }

  invisible(p)

}
