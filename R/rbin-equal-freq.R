#' Equal frequency binning
#'
#' Bin continuous data using the equal frequency binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Bare column name, character name, or variable holding a character
#'   name in \code{data}. A binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1.
#'   A character response is sorted in C-locale order (uppercase before lowercase)
#'   and the second value is the event; use a factor to choose the event level explicitly.
#'   Rows with a missing response are dropped with a warning.
#' @param predictor Bare column name, character name, or variable holding a character
#'   name in \code{data}. A numeric predictor variable.
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
#' @details Groups have approximately equal sizes and never split tied values.
#'   For each \code{k = 1, ..., bins - 1}, take the smallest observed value
#'   whose cumulative count reaches \code{k * n / bins}, where \code{n} is
#'   the number of non-missing predictors (the type-1 empirical quantile).
#'   All observations equal to that value stay in the lower group. The next
#'   distinct observed value is the scoring cut. Repeated cuts and cuts beyond
#'   the maximum are omitted; a message reports the requested and actual
#'   numbers of non-missing bins when fewer bins result. No bin is empty.
#'   Without ties, group sizes differ by at most one observation.
#'
#'   Both the top-level and table \code{lower_cut}/\code{upper_cut} fields
#'   contain the actual left-closed, right-open scoring intervals. The first
#'   and last intervals extend to negative and positive infinity; gaps go to
#'   the preceding group. \code{rbin_create()} reproduces the non-missing
#'   training counts using these intervals.
#'   Missing predictor values form a separate final group, and the equal
#'   frequency groups are built from non-missing values only. As with other
#'   numeric methods, missing predictors produce missing dummy indicators.
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
                       response  = column_name(substitute(response), parent.frame(), data),
                       predictor = column_name(substitute(predictor), parent.frame(), data),
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
