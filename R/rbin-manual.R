#' Manual binning
#'
#' Bin continuous data manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param cut_points Cut points for binning.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_manual}.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A \code{tibble}.
#'
#' @details Specify the upper open interval for each bin. `rbin`
#'   follows the left closed and right open interval. If you want to create_bins
#'   10 bins, the app will show you only 9 input boxes. The interval for the 10th bin 
#'   is automatically computed. For example, if you want the first bin to have all the
#'   values between the minimum and including 36, then you will enter the value 37. 
#'
#' @examples
#' \donttest{
#' bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#' bins
#'
#' # plot
#' plot(bins)
#' }
#'
#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL, include_na = TRUE) UseMethod("rbin_manual")

#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL, include_na = TRUE) {

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
  l_freq    <- append(min(byd, na.rm = TRUE), cut_points)
  u_freq    <- purrr::prepend((max(byd, na.rm = TRUE) + 1), cut_points)
  bins      <- length(cut_points) + 1

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
  
  result    <- list(bins = dplyr::bind_cols(intervals, k), method = "Manual", vars = var_names,
                    lower_cut = l_freq, upper_cut = u_freq)

  class(result) <- c("rbin_manual", "tibble", "data.frame")
  return(result)

}


#' @export
#'
print.rbin_manual <- function(x, ...) {

  rbin_print(x)
  cat("\n\n")
  x %>%
    magrittr::use_series(bins) %>%
    dplyr::select(cut_point, bin_count, good, bad, woe, iv, entropy) %>%
    print()
}

#' @rdname rbin_manual
#' @export
#'
plot.rbin_manual <- function(x, ...) {

  p <- plot_bins(x)
  print(p)

}