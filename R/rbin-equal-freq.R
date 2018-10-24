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
#' library(blorr)
#' rbin_equal_freq(bank_marketing, y, age, 20)
#'
#' @importFrom dplyr arrange mutate group_by summarise pull select bind_cols
#' @importFrom magrittr %>% divide_by subtract multiply_by use_series
#' @importFrom tibble tibble
#' @importFrom rlang enquo !!
#'
#' @export
#'
rbin_equal_freq <- function(data = NULL, response = NULL, predictor = NULL, bins = 20) UseMethod("rbin_equal_freq")

#' @export
#'
rbin_equal_freq.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 20) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  bm <- select(data, !! resp, !! pred)

  bin_prop <- 1 / 20

  bins <-
    1 %>%
    divide_by(bin_prop) %>%
    round()

  bin_length <-
    bm %>%
    nrow() %>%
    divide_by(bins) %>%
    round()

  first_bins <-
    bins %>%
    subtract(1) %>%
    multiply_by(bin_length)

  residual <-
    bm %>%
    nrow() %>%
    subtract(first_bins)

  bin_rep <-
    bins %>%
    subtract(1) %>%
    seq_len() %>%
    rep(each = bin_length) %>%
    c(rep(residual, residual))

  k <-
    bm %>%
    arrange(!! pred) %>%
    mutate(
      bin = bin_rep
    ) %>%
    group_by(bin) %>%
    summarise(
      bin_count = n(),
      good      = sum(!! resp == 1),
      bad       = sum(!! resp == 0)
    ) %>%
    mutate(
      bin_cum_count   = cumsum(bin_count),
      good_cum_count  = cumsum(good),
      bad_cum_count   = cumsum(bad),
      bin_prop        = bin_count / sum(bin_count),
      good_rate       = good / bin_count,
      bad_rate        = bad / bin_count,
      good_dist       = good / sum(good),
      bad_dist        = bad / sum(bad),
      woe             = log(bad_dist / good_dist),
      dist_diff       = bad_dist - good_dist,
      iv              = dist_diff * woe
    )

  lower <- c(1, (bin_length * seq_len(19) + 1))
  upper <- c(bin_length * seq_len(19), nrow(bm))

  bm2 <-
    bm %>%
    pull(!! pred) %>%
    sort()

  intervals <-
    tibble(lower, upper) %>%
    mutate(
      li = bm2[lower],
      ui = bm2[upper]
    ) %>%
    select(lower_cut = li, upper_cut = ui)

  result <- list(bins = bind_cols(intervals, k))
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
