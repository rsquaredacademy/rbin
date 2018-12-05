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
#' \dontrun{
#' rbin_equal_freq(mbank, y, age, 10)
#' }
#'
#' @importFrom magrittr %>%
#' @importFrom rlang !!
#'
#' @export
#'
rbin_equal_freq <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_freq")

#' @export
#'
rbin_equal_freq.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- rlang::enquo(response)
  pred <- rlang::enquo(predictor)
  
  bm <- 
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    magrittr::set_colnames(c("response", "predictor"))
  
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
  result     <- list(bins = dplyr::bind_cols(intervals, k))

  class(result) <- c("rbin_equal_freq", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_equal_freq <- function(x, ...) {
  x %>%
    magrittr::use_series(bins) %>%
    dplyr::select(lower_cut, upper_cut, bin_count, good, bad, good_rate, woe, iv, entropy) %>%
    print()
}

binned <- function(bin_prop) {

  1 %>%
    magrittr::divide_by(bin_prop) %>%
    round()

}

binlength <- function(bm, bins) {

  bm %>%
    nrow() %>%
    magrittr::divide_by(bins) %>%
    round()

}

firstbins <- function(bins, bin_length) {

  bins %>%
    magrittr::subtract(1) %>%
    magrittr::multiply_by(bin_length)

}

binresidual <- function (bm, first_bins) {

  bm %>%
    nrow() %>%
    magrittr::subtract(first_bins)

}

binrep <- function(bins, bin_length, residual) {

  bins %>%
    magrittr::subtract(1) %>%
    seq_len(.) %>%
    rep(each = bin_length) %>%
    c(rep(residual, residual))

}

freq_lower <- function(bin_length, bins) {

  c(1, (bin_length * seq_len((bins - 1)) + 1))

}

freq_upper <- function(bin_length, bins, bm) {

  c(bin_length * seq_len((bins - 1)), nrow(bm))

}

bm_2 <- function(bm) {

  bm %>%
    dplyr::pull(predictor) %>%
    sort()
}

freq_intervals <- function(bm2, lower, upper) {

  tibble::tibble(lower, upper) %>%
    dplyr::mutate(
      li = bm2[lower],
      ui = bm2[upper]
    ) %>%
    dplyr::select(lower_cut = li, upper_cut = ui)

}