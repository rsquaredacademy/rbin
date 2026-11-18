#' Winsorized binning
#'
#' Bin continuous data using winsorized method.
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
#'   name in \code{data}. A numeric predictor; non-missing values must be finite
#'   with absolute value up to 1e300.
#' @param bins Number of bins.
#' @param winsor_rate A value from 0.0 to 0.5.
#' @param min_val the low border, all values being lower than this will be replaced by this value. The default is set to the 5 percent quantile of predictor.
#' @param max_val the high border, all values being larger than this will be replaced by this value. The default is set to the 95 percent quantile of predictor.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param remove_na logical; if \code{TRUE}, missing values are removed while
#'   calculating quantiles. If \code{FALSE}, retained predictor values must not
#'   be missing; use \code{TRUE} to retain a separate missing-value bin.
#' @param type an integer between 1 and 9 selecting one of the nine quantile algorithms detailed in \code{quantile()} to be used.
#' @param x An object of class \code{rbin_winsorize}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_winsorize} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per interval (including
#'   empty intervals) and a final row for missing values when present;
#'   \code{method}; \code{vars}; \code{lower_cut}; \code{upper_cut}; and
#'   \code{clamp}, the fitted minimum and maximum used when scoring new data
#'   (absent if all predictor values are missing).
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

  rbin_winsorize_impl(data        = data,
                      response    = column_name(substitute(response), parent.frame(), data),
                      predictor   = column_name(substitute(predictor), parent.frame(), data),
                      bins        = bins,
                      include_na  = include_na,
                      winsor_rate = winsor_rate,
                      min_val     = min_val,
                      max_val     = max_val,
                      type        = type,
                      remove_na   = remove_na)

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
