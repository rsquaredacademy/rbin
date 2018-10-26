#' Quantile binning
#'
#' Bin continuous variables using quantiles
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param x An object of class \code{rbin_quantiles}.
#' @param ... further arguments passed to or from other methods.
#'
#' @examples
#' bins <- rbin_quantiles(marketing_bank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @importFrom stats quantile 
#'
#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_quantiles")

#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- enquo(response)
  pred <- enquo(predictor)

  var_names <- 
    data %>%
    select(!! resp, !! pred) %>%
    names()

  bm <-
    data %>%
    select(!! resp, !! pred) %>%
    set_colnames(c("response", "predictor"))

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
  result    <- list(bins = bind_cols(intervals, k), method = "Quantile", vars = var_names,
                    lower_cut = l_freq, upper_cut = u_freq)

  class(result) <- c("rbin_quantiles", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_quantiles <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  x %>%
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, woe, iv) %>%
    print()

}

#' @rdname rbin_quantiles
#' @export
#'
plot.rbin_quantiles <- function(x, ...) {

  x %>%
    use_series(bins) %>%
    ggplot() +
    geom_line(aes(x = bin, y = woe)) +
    geom_point(aes(x = bin, y = woe)) +
    xlab("Bins") + ylab("WoE") + ggtitle("WoE Trend")

}


ql_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(append(min(byd), cut_points))  

}

qu_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(prepend((max(byd) + 1), cut_points))

}

cutpoints <- function(byd, bins) {

  bin_prob   <- 1 / bins
  bq         <- quantile(byd, seq(0, 1, bin_prob))
  bin_len    <- bins + 1
  bq[c(-1, -bin_len)]

}