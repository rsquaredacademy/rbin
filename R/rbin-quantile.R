#' Quantile binning
#'
#' Bin continuous data using quantiles.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_quantiles}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
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
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) UseMethod("rbin_quantiles")

#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) {

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
  l_freq    <- ql_freq(byd, bins)
  u_freq    <- qu_freq(byd, bins)

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

  result    <- list(bins = cbind(intervals, k),
                    method = "Quantile",
                    vars = var_names,
                    lower_cut = l_freq,
                    upper_cut = u_freq)

  class(result) <- c("rbin_quantiles")
  return(result)

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

  return(p)

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
