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
#' @export
#'
rbin_factor_combine <- function(data, var, new_var, new_name) {

  vars           <- deparse(substitute(var))
  mydata         <- data[[vars]]
  current_lev    <- levels(mydata)
  l              <- length(new_var)

  for (i in seq_len(l)) {
    current_lev  <- gsub(new_var[i], new_name, current_lev)
  }

  levels(mydata) <- current_lev
  data[vars]     <- NULL
  out            <- cbind(data, mydata)
  nl             <- ncol(out)
  names(out)[nl] <- vars

  return(out)

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
#' @export
#'
rbin_factor <- function(data = NULL, response = NULL, predictor = NULL, include_na = TRUE) UseMethod("rbin_factor")

#' @export
#'
rbin_factor.default <- function(data = NULL, response = NULL, predictor = NULL, include_na = TRUE) {

  resp <- deparse(substitute(response))
  pred <- deparse(substitute(predictor))

  var_names <- names(data[, c(resp, pred)])
  prep_data <- data[, c(resp, pred)]

  if (include_na) {
    bm <- prep_data
  } else {
    bm <- na.omit(prep_data)
  }

  colnames(bm) <- c("response", "predictor")

  bm <- data.table(bm)

  # group and summarize
  bm_group <- bm[, .(bin_count = .N,
                     good = sum(response == 1),
                     bad = sum(response == 0)),
                 by = predictor]

  # create new columns
  bm_group[, ':='(bin_cum_count   = cumsum(bin_count),
                  good_cum_count  = cumsum(good),
                  bad_cum_count   = cumsum(bad),
                  bin_prop        = bin_count / sum(bin_count),
                  good_rate       = good / bin_count,
                  bad_rate        = bad / bin_count,
                  good_dist       = good / sum(good),
                  bad_dist        = bad / sum(bad))]

  bm_group[, woe := log(bad_dist / good_dist)]
  bm_group[, dist_diff := bad_dist - good_dist,]
  bm_group[, iv := dist_diff * woe,]
  bm_group[, entropy := (-1) * (((good / bin_count) * log2(good / bin_count)) +
                                  ((bad / bin_count) * log2(bad / bin_count)))]
  bm_group[, prop_entropy := (bin_count / sum(bin_count)) * entropy]

  setDF(bm_group)
  colnames(bm_group)[1] <- 'level'

  result <- list(bins = bm_group, method = "Custom", vars = var_names)

  class(result) <- c("rbin_factor")
  return(result)

}

#' @export
#'
print.rbin_factor <- function(x, ...) {

  rbin_print_custom(x)
  cat("\n\n")
  print(x$bins[c('level', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')])
}

#' @import ggplot2
#' @rdname rbin_factor
#' @export
#'
plot.rbin_factor <- function(x, print_plot = TRUE,...) {

  xseq <- nrow(x$bins)
	xaxis_breaks <- seq_len(xseq)
	xaxis_labels <- as.character(x$bins$level)

	p <-
	  ggplot(x$bins) +
	  geom_line(aes(x = xaxis_breaks, y = woe), color = "blue") +
	  geom_point(aes(x = xaxis_breaks, y = woe), color = "red") +
	  xlab("Levels") + ylab("WoE") + ggtitle("WoE Trend") +
	  scale_x_continuous(breaks = xaxis_breaks, labels = xaxis_labels)

  if (print_plot) {
    print(p)
  }

  invisible(p)

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

  vars <- deparse(substitute(predictor))
  nl <- nlevels(data[[vars]])
  levs <- levels(data[[vars]])

  for(i in seq_len(nl)) {
    data$temp <- ifelse(data[[vars]] == levs[i], 1, 0)
    n <- ncol(data)
    colnames(data)[n] <- paste0(vars, '_', levs[i])
  }

  return(data)

}
