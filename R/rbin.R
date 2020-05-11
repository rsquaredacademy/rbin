#' \code{rbin} package
#'
#' Tools for binning data.
#'
#' See the README on
#' \href{https://github.com/rsquaredacademy/rbin}{GitHub}
#'
#' @importFrom utils globalVariables
#' @docType package
#' @name rbin
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1") {
  utils::globalVariables(c(".", "bad", "bad", "dist", "bin", "bin_count", "bins",
                           "cut_point", "dist_diff", "good", "good_dist", "prop_entropy",
                           "good_rate", "iv", "li", "lower_cut", "n", "entropy",
                           "predictor2", "quantile", "ui", "upper_cut", "woe", "binned",
                           "bad_dist", "predictor", "response", "level", "archived", "temp"
  ))
}
