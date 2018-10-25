#' Winsorized binning
#'
#' Bin continuous variables using winsorized method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param winsor_rate A value from 0.0 to 0.5.
#' @param min_val the low border, all values being lower than this will be replaced by this value. The default is set to the 5 percent quantile of predictor.
#' @param max_val the high border, all values being larger than this will be replaced by this value. The default is set to the 95 percent quantile of predictor.
#'
#' @examples
#' rbin_winsorize(marketing_bank, y, age, 20, winsor_rate = 0.05)
#'
#' @importFrom DescTools Winsorize
#'
#' @export
#'
rbin_winsorize <- function(data = NULL, response = NULL, predictor = NULL, bins = 20, 
	winsor_rate = 0.05, min_val = NULL, max_val = NULL) UseMethod("rbin_winsorize")


#' @export
#'
rbin_winsorize.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 20, 
	winsor_rate = 0.05, min_val = NULL, max_val = NULL) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  probs_min <- 0 + winsor_rate
  probs_max <- 1 - winsor_rate

  bm <-
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor")) %>%
    mutate(predictor2 = Winsorize(predictor, minval = min_val, maxval = max_val, 
    	probs = c(probs_min, probs_max))) %>%
    select(response, predictor = predictor2)

  bm$bin <- NA

  byd <- bm$predictor
  bin_length <- (max(byd) - min(byd)) / bins
  l_freq <- append(min(byd), min(byd) + (bin_length * seq_len(bins)))[1:bins]
  u_freq <- min(byd) + (bin_length * seq_len(bins))
  n <- length(u_freq)
  u_freq[n] <- max(byd) + 1

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
  class(result) <- c("rbin_winsorize", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_winsorize <- function(x, ...) {
  x %>%
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, good_rate, woe, iv) %>%
    print()
}