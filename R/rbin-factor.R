#' Combine levels
#'
#' Manually combine levels of categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param var An object of class \code{factor}.
#' @param new_var A character vector; it should include the names of the levels to be combined.
#' @param new_name Name of the combined level.
#'
#' @return A \code{tibble}.
#'
#' @examples
#' upper <- c("secondary", "tertiary")
#' out <- rbin_factor_combine(mbank, education, upper, "upper")
#' table(out$education)
#'
#' out <- rbin_factor_combine(mbank, education, c("secondary", "tertiary"), "upper")
#' table(out$education)
#'
#' @importFrom rlang :=
#'
#' @export
#'
rbin_factor_combine <- function(data, var, new_var, new_name) {

  vars <- rlang::enquo(var)

  var_name <-
    data %>%
    dplyr::select(!! vars) %>%
    names()

  out <-
    data %>%
    dplyr::mutate(temp = forcats::fct_collapse(!! vars, new_var = new_var)) %>%
    dplyr::rename(archived = !! var_name) %>%
    dplyr::select(-archived)

  out$temp    <- as.character(out$temp)
  n           <- which(out$temp == "new_var")
  out$temp[n] <- new_name
  out$temp    <- as.factor(out$temp)

  out %>%
    dplyr::rename(!! var_name := temp)

}

#' Factor binning
#'
#' Weight of evidence and information value for categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_factor}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @examples
#' bins <- rbin_factor(mbank, y, education)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @importFrom magrittr %<>%
#'
#' @export
#'
rbin_factor <- function(data = NULL, response = NULL, predictor = NULL, include_na = TRUE) UseMethod("rbin_factor")

#' @export
#'
rbin_factor.default <- function(data = NULL, response = NULL, predictor = NULL, include_na = TRUE) {

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

  bm %<>%
    dplyr::group_by(predictor) %>%
    dplyr::summarise(
      bin_count = dplyr::n(),
      good      = sum(response == 1),
      bad       = sum(response == 0)
    ) %>%
    dplyr::mutate(
      bin_cum_count   = cumsum(bin_count),
      good_cum_count  = cumsum(good),
      bad_cum_count   = cumsum(bad),
      bin_prop        = bin_count / sum(bin_count),
      good_rate       = good / bin_count,
      bad_rate        = bad / bin_count,
      good_dist       = good / sum(good),
      bad_dist        = bad / sum(bad),
      woe             = log(bad_dist / good_dist),
      dist_diff       = bad_dist - good_dist,
      iv              = dist_diff * woe,
      entropy         = (-1) * (((good / bin_count) * log2(good / bin_count)) +
        ((bad / bin_count) * log2(bad / bin_count))) ,
      prop_entropy    = (bin_count / sum(bin_count)) * entropy
    ) %>%
    dplyr::rename(level = predictor)

  result <- list(bins = bm, method = "Custom", vars = var_names)

  class(result) <- c("rbin_factor", "tibble", "data.frame")
  return(result)

}

#' @export
#'
print.rbin_factor <- function(x, ...) {

  rbin_print_custom(x)
  cat("\n\n")
  x %>%
    magrittr::use_series(bins) %>%
    dplyr::select(level, bin_count, good, bad, woe, iv, entropy) %>%
    print()
}

#' @rdname rbin_factor
#' @export
#'
plot.rbin_factor <- function(x, print_plot = TRUE,...) {

  xseq <-
	  x %>%
	  magrittr::use_series(bins) %>%
	  nrow()

	xaxis_breaks <- seq_len(xseq)
	xaxis_labels <- as.character(x$bins$level)

	p <-
		x %>%
	  magrittr::use_series(bins) %>%
	  ggplot2::ggplot() +
	  ggplot2::geom_line(ggplot2::aes(x = xaxis_breaks, y = woe), color = "blue") +
	  ggplot2::geom_point(ggplot2::aes(x = xaxis_breaks, y = woe), color = "red") +
	  ggplot2::xlab("Levels") + ggplot2::ylab("WoE") + ggplot2::ggtitle("WoE Trend") +
	  ggplot2::scale_x_continuous(breaks = xaxis_breaks, labels = xaxis_labels)

  if (print_plot) {
    print(p)
  } else {
    return(p)
  }

}

#' Create dummy variables
#'
#' Create dummy variables for categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param predictor Variable for which dummy variables must be created.
#'
#' @return A \code{tibble} with dummy variables.
#'
#' @examples
#' upper <- c("secondary", "tertiary")
#' out <- rbin_factor_combine(mbank, education, upper, "upper")
#' rbin_factor_create(out, education)
#'
#' @export
#'
rbin_factor_create <- function(data, predictor) {

  pred <- rlang::enquo(predictor)

  data2 <-
    data %>%
    dplyr::select(!! pred)

  bm_rec <- recipes::recipe( ~ ., data = data2)

  final_data <-
    bm_rec %>%
    recipes::step_dummy(!! pred) %>%
    recipes::prep(training = data2, retain = TRUE) %>%
    recipes::bake(new_data = data2)

  dplyr::bind_cols(data, final_data)

}
