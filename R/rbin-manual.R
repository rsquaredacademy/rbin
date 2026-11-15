#' Manual binning
#'
#' Bin continuous data manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable; a binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1; for character data the two
#'   values are sorted and the second is treated as 1. Rows with a missing
#'   response are dropped with a warning.
#' @param predictor Predictor variable.
#' @param cut_points Cut points for binning.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_manual}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_manual} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per interval (including
#'   empty intervals) and a final row for missing values when present;
#'   \code{method}; \code{vars}; \code{lower_cut}; and \code{upper_cut}.
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

  rbin_manual_impl(data       = data,
                   response   = deparse(substitute(response)),
                   predictor  = deparse(substitute(predictor)),
                   cut_points = cut_points,
                   include_na = include_na)

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

  invisible(p)

}
