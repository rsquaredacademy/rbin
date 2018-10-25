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
#' k <- rbin_manual(marketing_bank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#' rbin_create(marketing_bank, age, k)
#'
#' @importFrom recipes recipe step_dummy prep bake
#'
#' @export
#'
rbin_create <- function(data, predictor, bins) {

  pred <- enquo(predictor)

  pred_name <-
    data %>%
    select(!! pred) %>%
    names()

  data2 <-
    data %>%
    select(predictor = !! pred)

  l_freq <- bins$lower_cut
  u_freq <- bins$upper_cut
  lbins  <- length(bins$bins$bin)

  data2$binned <- NA
  dummy_names <- bins$bins$cut_point

  for (i in seq_len(lbins)) {
    data2$binned[data2$predictor >= l_freq[i] & data2$predictor < u_freq[i]] <-
      dummy_names[i]
  }

  bm_rec <- recipe( ~ ., data = data2)

  binned_data <-
    bm_rec %>%
    step_dummy(binned) %>%
    prep(training = data2, retain = TRUE) %>%
    bake(newdata = data2)

  bin_names <- f_bin(u_freq)[-1]
  sym_sign  <- c(rep("_<_", (lbins - 2)), "_>=_")

  final_data <-
    binned_data %>%
    select(-predictor) %>%
    set_colnames(paste0(rep(pred_name, (lbins - 2)), sym_sign, bin_names))

  bind_cols(data, final_data)

}

