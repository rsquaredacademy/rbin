#' Equal frequency binning
#'
#' Bin continuous data using the equal frequency binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' rbin_equal_freq(mbank, y, age, 10)
#'
#' @export
#'
rbin_equal_freq <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_freq")

#' @export
#'
rbin_equal_freq.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- deparse(substitute(response))
  pred <- deparse(substitute(predictor))
  bm <- data[, c(resp, pred)]
  colnames(bm) <- c("response", "predictor")

  bin_prop   <- 1 / 20
  bins       <- binned(bin_prop)
  bin_length <- binlength(bm, bins)
  first_bins <- firstbins(bins, bin_length)
  residual   <- binresidual(bm, first_bins)
  bin_rep    <- binrep(bins, bin_length, residual)
  k          <- freq_bin_create(bm, bin_rep)
  lower      <- freq_lower(bin_length, bins)
  upper      <- freq_upper(bin_length, bins, bm)
  bm2        <- bm_2(bm)
  intervals  <- freq_intervals(bm2, lower, upper)
  result     <- list(bins = cbind(intervals, k))

  class(result) <- c("rbin_equal_freq", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_equal_freq <- function(x, ...) {

  print(x$bins[c('lower_cut', 'upper_cut', 'bin_count', 'good', 'bad', 'good_rate',
           'woe', 'iv', 'entropy')])

}

binned <- function(bin_prop) {
  round(1 / bin_prop)
}

binlength <- function(bm, bins) {
  round(nrow(bm) / bins)
}

firstbins <- function(bins, bin_length) {
  (bins - 1) * bin_length
}

binresidual <- function (bm, first_bins) {
  nrow(bm) - first_bins
}

binrep <- function(bins, bin_length, residual) {
  c(rep(seq_len((bins - 1)), each = bin_length), rep(residual, residual))
}

freq_lower <- function(bin_length, bins) {

  c(1, (bin_length * seq_len((bins - 1)) + 1))

}

freq_upper <- function(bin_length, bins, bm) {

  c(bin_length * seq_len((bins - 1)), nrow(bm))

}

bm_2 <- function(bm) {
  sort(bm$predictor)
}

freq_intervals <- function(bm2, lower, upper) {

  result <- data.frame(lower, upper)
  result$li <- bm2[lower]
  result$ui <- bm2[upper]
  out <- result[c('li', 'ui')]
  colnames(out) <- c('lower_cut', 'upper_cut')
  return(out)

}
