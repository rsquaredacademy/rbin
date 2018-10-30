#' Equal frequency binning
#'
#' Bin continuous variables using the equal frequency binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#'
#' @examples
#' rbin_equal_freq(mbank, y, age, 10)
#'
#' @importFrom dplyr arrange mutate group_by summarise pull select bind_cols
#' @importFrom magrittr %>% divide_by subtract multiply_by use_series
#' @importFrom tibble tibble
#' @importFrom rlang enquo !!
#'
#' @export
#'
rbin_equal_freq <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_freq")

#' @export
#'
rbin_equal_freq.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- enquo(response)
  pred <- enquo(predictor)
  
  bm <- 
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor"))
  
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
  result     <- list(bins = bind_cols(intervals, k))

  class(result) <- c("rbin_equal_freq", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_equal_freq <- function(x, ...) {
  x %>%
    use_series(bins) %>%
    select(lower_cut, upper_cut, bin_count, good, bad, good_rate, woe, iv) %>%
    print()
}

binned <- function(bin_prop) {

  1 %>%
    divide_by(bin_prop) %>%
    round()

}

binlength <- function(bm, bins) {

  bm %>%
    nrow() %>%
    divide_by(bins) %>%
    round()

}

firstbins <- function(bins, bin_length) {

  bins %>%
    subtract(1) %>%
    multiply_by(bin_length)

}

binresidual <- function (bm, first_bins) {

  bm %>%
    nrow() %>%
    subtract(first_bins)

}

binrep <- function(bins, bin_length, residual) {

  bins %>%
    subtract(1) %>%
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
    pull(predictor) %>%
    sort()
}

freq_intervals <- function(bm2, lower, upper) {

  tibble(lower, upper) %>%
    mutate(
      li = bm2[lower],
      ui = bm2[upper]
    ) %>%
    select(lower_cut = li, upper_cut = ui)

}