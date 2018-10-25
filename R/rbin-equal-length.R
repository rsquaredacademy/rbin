#' Equal length binning
#'
#' Bin continuous variables using the equal length binning method.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param x An object of class \code{rbin_equal_length}.
#' @param ... further arguments passed to or from other methods.
#'
#' @examples
#' bins <- rbin_equal_length(marketing_bank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @importFrom magrittr set_colnames
#'
#' @export
#'
rbin_equal_length <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_length")

#' @export
#'
rbin_equal_length <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  bm <-
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor"))

  bm$bin    <- NA
  byd       <- bm$predictor
  l_freq    <- el_freq(byd, bins)
  u_freq    <- eu_freq(byd, bins)

  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }

  k         <- bin_create(bm)
  sym_sign  <- c(rep("<", (bins - 1)), ">=")
  fbin2     <- f_bin(u_freq)  
  intervals <- create_intervals(sym_sign, fbin2)
  result    <- list(bins = bind_cols(intervals, k), lower_cut = l_freq, upper_cut = u_freq)

  class(result) <- c("rbin_equal_length", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_equal_length <- function(x, ...) {
  x %>%
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, good_rate, woe, iv) %>%
    print()
}

#' @rdname rbin_equal_length
#' @importFrom ggplot2 ggplot geom_line xlab ylab aes ggtitle geom_point
#' @export
#'
plot.rbin_equal_length <- function(x, ...) {

  x %>%
    use_series(bins) %>%
    ggplot() +
    geom_line(aes(x = bin, y = woe)) +
    geom_point(aes(x = bin, y = woe)) +
    xlab("Bins") + ylab("WoE") + ggtitle("WoE Trend")

}

el_freq <- function(byd, bins) {

  bin_length <- (max(byd) - min(byd)) / bins
  append(min(byd), min(byd) + (bin_length * seq_len(bins)))[1:bins]

}

eu_freq <- function(byd, bins) {

  bin_length <- (max(byd) - min(byd)) / bins
  ufreq     <- min(byd) + (bin_length * seq_len(bins))
  n          <- length(ufreq)
  ufreq[n]  <- max(byd) + 1
  return(ufreq)

}