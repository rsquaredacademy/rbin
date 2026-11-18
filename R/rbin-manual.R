#' Manual binning
#'
#' Bin continuous data manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Bare column name, character name, or variable holding a character
#'   name in \code{data}. A binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1.
#'   A character response is sorted in byte (C-locale) order: uppercase before
#'   lowercase, ASCII before accented characters; use a factor to choose the event level.
#'   The second value is the event.
#'   Rows with a missing response are dropped with a warning.
#' @param predictor Bare column name, character name, or variable holding a character
#'   name in \code{data}. A numeric predictor variable.
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
#' @details Cut points are open upper bounds: intervals are left closed and
#'   right open, \code{[lower, upper)}. Supply nine cut points for ten bins;
#'   the last bin has no upper bound. For an integer predictor, a cut at 37
#'   includes integers through 36. For continuous data, that cut includes every
#'   value below 37, including 36.5; choose the continuous boundary directly.
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
                   response   = column_name(substitute(response), parent.frame(), data),
                   predictor  = column_name(substitute(predictor), parent.frame(), data),
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
