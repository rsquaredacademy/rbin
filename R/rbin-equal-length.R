#' Equal length binning
#'
#' Bin continuous data using the equal length binning method.
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
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_equal_length}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_equal_length} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per interval (including
#'   empty intervals) and a final row for missing values when present;
#'   \code{method}; \code{vars}; \code{lower_cut}; and \code{upper_cut}.
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

  rbin_equal_length_impl(data       = data,
                         response   = column_name(substitute(response), parent.frame(), data),
                         predictor  = column_name(substitute(predictor), parent.frame(), data),
                         bins       = bins,
                         include_na = include_na)

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

  c(min(byd, na.rm = TRUE), equal_width_cuts(byd, bins))

}

eu_freq <- function(byd, bins) {

  c(equal_width_cuts(byd, bins), max(byd, na.rm = TRUE) + 1)

}

equal_width_cuts <- function(x, bins) {

  lo <- as.double(min(x, na.rm = TRUE))
  hi <- as.double(max(x, na.rm = TRUE))
  if (!is.finite(lo) || !is.finite(hi)) {
    stop("equal-width binning requires finite predictor values", call. = FALSE)
  }
  # Supported domain: |x| <= 1e300. Near the double-precision limit the cut
  # arithmetic is platform dependent, so exact-cut membership can't be promised.
  if (max(abs(lo), abs(hi)) > 1e300) {
    stop("equal-width and winsorized binning support predictor values with ",
         "absolute value up to 1e300; rescale the predictor first", call. = FALSE)
  }
  i <- seq_len(bins - 1L)
  p <- i / bins
  span <- hi - lo
  # Multiply before dividing so exactly representable mathematical cuts keep
  # their left-closed membership. Fall back to scaled/convex arithmetic only
  # when the product or the span overflows.
  cuts <- if (is.finite(span)) {
    numerator <- span * i
    lo + if (all(is.finite(numerator))) numerator / bins else span * p
  } else {
    (1 - p) * lo + p * hi
  }
  if (any(!is.finite(cuts)) || is.unsorted(cuts)) {
    stop("could not construct finite ordered equal-width boundaries", call. = FALSE)
  }
  cuts

}
