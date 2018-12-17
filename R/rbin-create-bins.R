#' Create dummy variables
#'
#' Create dummy variables from bins.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param predictor Variable for which dummy variables must be created.
#' @param bins An object of class \code{rbin_manual} or \code{rbin_quantiles} or \code{rbin_equal_length} or \code{rbin_winsorized}.
#'
#' @return \code{data} with dummy variables.
#'
#' @examples
#' \donttest{
#' k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#' rbin_create(mbank, age, k)
#' }
#'
#' @export
#'
rbin_create <- function(data, predictor, bins) {

  pred <- rlang::enquo(predictor)

  pred_name <-
    data %>%
    dplyr::select(!! pred) %>%
    names()

  data2 <-
    data %>%
    dplyr::select(predictor = !! pred)

  l_freq <- bins$lower_cut
  u_freq <- bins$upper_cut
  bin_na <- sum(is.na(bins$bins$bin))
  lbins  <- length(bins$bins$bin) - bin_na
  
  data2$binned <- NA
  dummy_names <- bins$bins$cut_point

  for (i in seq_len(lbins)) {
    data2$binned[data2$predictor >= l_freq[i] & data2$predictor < u_freq[i]] <-
      dummy_names[i]
  }

  bm_rec <- recipes::recipe( ~ ., data = data2)

  binned_data <-
    bm_rec %>%
    recipes::step_dummy(binned) %>%
    recipes::prep(training = data2, retain = TRUE) %>%
    recipes::bake(new_data = data2)

  bin_names <- f_bin(u_freq)[-1]
  sym_sign  <- c(rep("_<_", (lbins - 2)), "_>=_")

  final_data <-
    binned_data %>%
    dplyr::select(-predictor) %>%
    magrittr::set_colnames(paste0(rep(pred_name, (lbins - 2)), sym_sign, bin_names))

  dplyr::bind_cols(data, final_data)

}

