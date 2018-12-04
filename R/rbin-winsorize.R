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
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_winsorize}.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' \dontrun{
#' bins <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
#' bins
#'
#' # plot
#' plot(bins)
#' }
#'
#' @export
#'
rbin_winsorize <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, 
	winsor_rate = 0.05, min_val = NULL, max_val = NULL, include_na = TRUE) UseMethod("rbin_winsorize")


#' @export
#'
rbin_winsorize.default <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, 
	winsor_rate = 0.05, min_val = NULL, max_val = NULL, include_na = TRUE) {

  resp <- rlang::enquo(response)
  pred <- rlang::enquo(predictor)

  probs_min <- 0 + winsor_rate
  probs_max <- 1 - winsor_rate

  var_names <- 
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    names()

  if (include_na) {
    bm <-
      data %>%
      dplyr::select(!! resp, !! pred) %>%
      magrittr::set_colnames(c("response", "predictor")) %>%
      dplyr::mutate(predictor2 = DescTools::Winsorize(predictor, minval = min_val, maxval = max_val, 
        probs = c(probs_min, probs_max), na.rm = TRUE)) %>%
      dplyr::select(response, predictor = predictor2)
  } else {
    bm <-
      data %>%
      dplyr::select(!! resp, !! pred) %>%
      dplyr::filter(!is.na(!! resp), !is.na(!! pred)) %>%
      magrittr::set_colnames(c("response", "predictor")) %>%
      dplyr::mutate(predictor2 = DescTools::Winsorize(predictor, minval = min_val, maxval = max_val, 
        probs = c(probs_min, probs_max), na.rm = TRUE)) %>%
      dplyr::select(response, predictor = predictor2)
  }
 
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

  if (include_na) {

    na_present <- 
      k %>%
      nrow() %>%
      magrittr::is_greater_than(bins)

    if (na_present) {
      intervals <- dplyr::add_row(intervals, cut_point = 'NA')
    }

  }

  result    <- list(bins = dplyr::bind_cols(intervals, k), method = "Winsorize", vars = var_names,
                    lower_cut = l_freq, upper_cut = u_freq)

  class(result) <- c("rbin_winsorize", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_winsorize <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  x %>%
    magrittr::use_series(bins) %>%
    dplyr::select(cut_point, bin_count, good, bad, woe, iv, entropy) %>%
    print()
}

#' @rdname rbin_winsorize
#' @export
#'
plot.rbin_winsorize <- function(x, ...) {

  p <- plot_bins(x)
  print(p)

}