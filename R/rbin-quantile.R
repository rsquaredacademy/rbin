#' Quantile binning
#'
#' Bin continuous data using quantiles.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable; a binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1; for character data the two
#'   values are sorted and the second is treated as 1. Rows with a missing
#'   response are dropped with a warning.
#' @param predictor Predictor variable.
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
                      response   = deparse(substitute(response)),
                      predictor  = deparse(substitute(predictor)),
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

  bin_prob   <- 1 / bins
  bq         <- stats::quantile(byd, seq(0, 1, bin_prob), na.rm = TRUE)
  bin_len    <- bins + 1
  bq[c(-1, -bin_len)]

}
