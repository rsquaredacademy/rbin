#' Equal length binning
#'
#' Bin continuous data using the equal length binning method.
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
                         response   = deparse(substitute(response)),
                         predictor  = deparse(substitute(predictor)),
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

  bin_length <- (max(byd, na.rm = TRUE) - min(byd, na.rm = TRUE)) / bins
  append(min(byd, na.rm = TRUE), min(byd, na.rm = TRUE) + (bin_length * seq_len(bins)))[1:bins]

}

eu_freq <- function(byd, bins) {

  bin_length <- (max(byd, na.rm = TRUE) - min(byd, na.rm = TRUE)) / bins
  ufreq      <- min(byd, na.rm = TRUE) + (bin_length * seq_len(bins))
  n          <- length(ufreq)
  ufreq[n]   <- max(byd, na.rm = TRUE) + 1
  return(ufreq)

}
