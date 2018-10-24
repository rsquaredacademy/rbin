#' Quantile binning
#'
#' Bin continuous variables using quantiles
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins
#'
#' @examples
#' rbin_quantiles(marketing_bank, y, age, 10)
#'
#'
#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_quantiles")

#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  bm <-
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor"))

  bm$bin <- NA

  byd <- bm$predictor
  bin_prob <- 1 / bins
  bq <- quantile(bm$predictor, seq(0, 1, bin_prob))
  bin_len <- bins + 1
  cut_points <- bq[c(-1, -bin_len)]
  l_freq <- unname(append(min(byd), cut_points))
  u_freq <- unname(prepend((max(byd) + 1), cut_points))

  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }

  k <-
    bm %>%
    arrange(predictor) %>%
    group_by(bin) %>%
    summarise(
      bin_count = n(),
      good      = sum(response == 1),
      bad       = sum(response == 0)
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

  sym_sign <- c(rep("<", (bins - 1)), ">")
  
  len_fbin <- length(u_freq)
  fbin <- u_freq[-len_fbin]
  l_fbin <- length(fbin)
  fbin2 <- c(fbin, fbin[l_fbin])

  intervals <-
    tibble(sym_sign, fbin2) %>%
    mutate(cut_point = paste(sym_sign, fbin2)) %>%
    select(cut_point)

  result <- list(bins = bind_cols(intervals, k))
  class(result) <- c("rbin_quantiles", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_quantiles <- function(x, ...) {
  x %>%
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, good_rate, woe, iv) %>%
    print()
}