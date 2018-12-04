#' Quantile binning
#'
#' Bin continuous variables using quantiles.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param bins Number of bins.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_quantiles}.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' \dontrun{
#' bins <- rbin_quantiles(mbank, y, age, 10)
#' bins
#'
#' # plot
#' plot(bins)
#' }
#'
#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) UseMethod("rbin_quantiles")

#' @export
#'
rbin_quantiles <- function(data = NULL, response = NULL, predictor = NULL, bins = 10, include_na = TRUE) {

  resp <- rlang::enquo(response)
  pred <- rlang::enquo(predictor)

  var_names <- 
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    names()

  if (include_na) {
    bm <-
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    magrittr::set_colnames(c("response", "predictor"))
  } else {
    bm <-
    data %>%
    dplyr::select(!! resp, !! pred) %>%
    dplyr::filter(!is.na(!! resp), !is.na(!! pred)) %>%
    magrittr::set_colnames(c("response", "predictor"))
  }

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

  if (include_na) {

    na_present <- 
      k %>%
      nrow() %>%
      magrittr::is_greater_than(bins)

    if (na_present) {
      intervals <- dplyr::add_row(intervals, cut_point = 'NA')
    }

  }
  
  result    <- list(bins = dplyr::bind_cols(intervals, k), method = "Quantile", vars = var_names,
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
    magrittr::use_series(bins) %>%
    dplyr::select(cut_point, bin_count, good, bad, woe, iv, entropy) %>%
    print()

}

#' @rdname rbin_quantiles
#' @export
#'
plot.rbin_quantiles <- function(x, ...) {

  p <- plot_bins(x)
  print(p)

}


ql_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(append(min(byd, na.rm = TRUE), cut_points))  

}

qu_freq <- function(byd, bins) {

  cut_points <- cutpoints(byd, bins)
  unname(purrr::prepend((max(byd, na.rm = TRUE) + 1), cut_points))

}

cutpoints <- function(byd, bins) {

  bin_prob   <- 1 / bins
  bq         <- stats::quantile(byd, seq(0, 1, bin_prob), na.rm = TRUE)
  bin_len    <- bins + 1
  bq[c(-1, -bin_len)]

}