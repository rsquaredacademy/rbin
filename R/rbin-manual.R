#' Manual binning
#'
#' Bin continuous variables manually.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param cut_points Cut points for binning.
#' @param x An object of class \code{rbin_manual}.
#' @param ... further arguments passed to or from other methods.
#'
#' @examples
#' bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @importFrom purrr prepend
#'
#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL) UseMethod("rbin_manual")

#' @export
#'
rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, cut_points = NULL) {

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
  l_freq    <- append(min(byd), cut_points)
  u_freq    <- prepend((max(byd) + 1), cut_points)
  bins      <- length(cut_points) + 1

  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }
  
  k         <- bin_create(bm)
  sym_sign  <- c(rep("<", (bins - 1)), ">=")
  fbin2     <- f_bin(u_freq)  
  intervals <- create_intervals(sym_sign, fbin2)
  result    <- list(bins = bind_cols(intervals, k), method = "Manual", vars = var_names,
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
    use_series(bins) %>%
    select(cut_point, bin_count, good, bad, woe, iv) %>%
    print()
}

#' @rdname rbin_manual
#' @export
#'
plot.rbin_manual <- function(x, ...) {

  plot_bins(x)

}