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

  bm$bin    <- NA
  byd       <- bm$predictor
  l_freq    <- el_freq(byd, bins)
  u_freq    <- eu_freq(byd, bins)

  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }

  k         <- bin_create(bm)
  sym_sign  <- c(rep("<", (bins - 1)), ">")
  fbin2     <- f_bin(u_freq)  
  intervals <- create_intervals(sym_sign, fbin2)
  result    <- list(bins = bind_cols(intervals, k))

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