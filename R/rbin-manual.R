#' Manual binning
#'
#' Bin continuous variables manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param cut_points Cut points for binning.
#'
#' @examples
#' library(blorr)
#' rbin_manual(bank_marketing, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#'
#' @importFrom purrr prepend
#'
#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL) UseMethod("rbin_manual")

#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  bm <-
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor"))

  bm$bin <- NA

  byd <- bm$predictor
  l_freq <- append(min(byd), cut_points)
  u_freq <- prepend((max(byd) + 1), cut_points)
  bins <- length(cut_points) + 1

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
  
  intervals <-
    tibble(sym_sign, u_freq) %>%
    mutate(cut_point = paste(sym_sign, l_freq)) %>%
    select(cut_point)

  result <- list(bins = bind_cols(intervals, k))
  class(result) <- c("rbin_manual", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_manual <- function(x, ...) {
  x %>%
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, good_rate, woe, iv) %>%
    print()
}