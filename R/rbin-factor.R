#' Combine levels
#'
#' Manually combine levels of categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param var An object of class \code{factor}.
#' @param new_var A character vector.
#' @param new_name Name of the combined level.
#'
#' @examples
#' upper <- c("secondary", "tertiary")
#' out <- rbin_factor_combine(marketing_bank, education, upper, "upper")
#' table(out$education)
#'
#' out <- rbin_factor_combine(marketing_bank, education, c("secondary", "tertiary"), "upper")
#' table(out$education)
#'
#' @importFrom forcats fct_collapse
#' @importFrom dplyr rename
#' @importFrom rlang :=
#'
#' @export
#'
rbin_factor_combine <- function(data, var, new_var, new_name) {

  vars <- enquo(var)

  var_name <-
    data %>%
    select(!! vars) %>%
    names()

  out <-
    data %>%
    mutate(temp = fct_collapse(!! vars, new_var = new_var)) %>%
    rename(archived = !! var_name) %>%
    select(-archived)

  out$temp    <- as.character(out$temp)
  n           <- which(out$temp == "new_var")
  out$temp[n] <- new_name
  out$temp    <- as.factor(out$temp)

  out %>%
    rename(!! var_name := temp)

}

#' Factor binning
#'
#' Weight of evidence and information value for categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Response variable.
#' @param predictor Predictor variable.
#' @param x An object of class \code{rbin_factor}.
#' @param ... further arguments passed to or from other methods.
#'
#' @examples
#' bins <- rbin_factor(marketing_bank, y, education)
#' bins
#'
#' # plot
#' plot(bins)
#'
#' @importFrom magrittr %<>%
#'
#' @export
#'
rbin_factor <- function(data = NULL, response = NULL, predictor = NULL) UseMethod("rbin_factor")

#' @export
#'
rbin_factor <- function(data = NULL, response = NULL, predictor = NULL) {

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

  bm %<>%
    group_by(predictor) %>%
    summarise(
      bin_count = n(),
      good      = sum(response == 1),
      bad       = sum(response == 0)
    ) %>%
    mutate(
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
      iv              = dist_diff * woe
    ) %>%
    rename(level = predictor)

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
    use_series(bins) %>%
    select(level, bin_count, good, bad, woe, iv) %>%
    print()
}

#' @rdname rbin_factor
#' @importFrom ggplot2 geom_bar
#' @export
#'
plot.rbin_factor <- function(x, ...) {

  x %>%
    use_series(bins) %>%
    ggplot() +
    geom_bar(aes(x = level, y = woe), stat = "identity", width = 0.25, 
             fill = "blue") + xlab("Levels") + ylab("WoE") + 
    ggtitle("WoE Trend")

}

#' Create dummy variables
#'
#' Create dummy variables for categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param predictor Variable for which dummy variables must be created.
#'
#' @return \code{data} with dummy variables.
#'
#' @examples
#' upper <- c("secondary", "tertiary")
#' out <- rbin_factor_combine(marketing_bank, education, upper, "upper")
#' rbin_factor_create(out, education)
#'
#'
#' @export
#'
rbin_factor_create <- function(data, predictor) {

  pred <- enquo(predictor)

  data2 <-
    data %>%
    select(!! pred)

  bm_rec <- recipe( ~ ., data = data2)

  final_data <- 
    bm_rec %>%
    step_dummy(!! pred) %>%
    prep(training = data2, retain = TRUE) %>%
    bake(newdata = data2) 

  bind_cols(data, final_data)

}
