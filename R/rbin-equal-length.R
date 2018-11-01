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
#' @return A \code{tibble}.
#'
#' @examples
#' bins <- rbin_equal_length(mbank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @export
#'
rbin_equal_length <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) UseMethod("rbin_equal_length")

#' @export
#'
rbin_equal_length <- function(data = NULL, response = NULL, predictor = NULL, bins = 10) {

  resp <- rlang::enquo(response)
  pred <- rlang::enquo(predictor)

  var_names <- 
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    names()

  bm <-
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    magrittr::set_colnames(c("response", "predictor"))

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
  result    <- list(bins = dplyr::bind_cols(intervals, k), method = "Equal Length", vars = var_names,
                    lower_cut = l_freq, upper_cut = u_freq)

  class(result) <- c("rbin_equal_length", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_equal_length <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  x %>%
    magrittr::use_series(bins) %>%
    dplyr::select(cut_point, bin_count, good, bad, woe, iv) %>%
    print()
}

#' @rdname rbin_equal_length
#' @export
#'
plot.rbin_equal_length <- function(x, ...) {

  p <- plot_bins(x)
  print(p)

}

el_freq <- function(byd, bins) {

  bin_length <- (max(byd) - min(byd)) / bins
  append(min(byd), min(byd) + (bin_length * seq_len(bins)))[1:bins]

}

eu_freq <- function(byd, bins) {

  bin_length <- (max(byd) - min(byd)) / bins
  ufreq      <- min(byd) + (bin_length * seq_len(bins))
  n          <- length(ufreq)
  ufreq[n]   <- max(byd) + 1
  return(ufreq)

}