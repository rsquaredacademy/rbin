#' Quantile binning
#'
#' Bin continuous data using quantiles.
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
#'   Infinite values are supported when the computed cut points are numbers;
#'   interpolation producing \code{NA} or \code{NaN} cut points errors.
#' @param bins Number of bins.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_quantiles}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_quantiles} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per interval (including
#'   empty intervals) and a final row for missing values when present;
#'   \code{method}; \code{vars}; \code{lower_cut}; and \code{upper_cut}.
#'
#' @examples
#' bins <- rbin_quantiles(mbank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) {

  rbin_quantiles_impl(data       = data,
                      response   = column_name(substitute(response), parent.frame(), data),
                      predictor  = column_name(substitute(predictor), parent.frame(), data),
                      bins       = bins,
                      include_na = include_na)

}


#' @export
#'
print.rbin_quantiles <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  print(x$bins[c('cut_point', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')])

}

#' @rdname rbin_quantiles
#' @export
#'
plot.rbin_quantiles <- function(x, print_plot = TRUE, ...) {

  p <- plot_bins(x)

  if (print_plot) {
    print(p)
  }

  invisible(p)

}


ql_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(append(min(byd, na.rm = TRUE), cut_points))

}

qu_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(c(cut_points, (max(byd, na.rm = TRUE) + 1)))

}

cutpoints <- function(byd, bins) {

  cuts <- stats::quantile(byd, seq_len(bins - 1L) / bins, na.rm = TRUE)
  if (anyNA(cuts)) {
    stop("computed cut points contain NA or NaN; cannot form numeric bins",
         call. = FALSE)
  }
  cuts

}
