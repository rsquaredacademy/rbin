#' Combine levels
#'
#' Manually combine levels of categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param var Bare or character name of a factor or character column in \code{data}.
#' @param new_var A character vector containing the names of levels to combine.
#'   An \code{NA} selects both an explicit \code{NA} level and missing factor codes.
#' @param new_name Name of the combined level.
#'
#' @return A \code{data.frame} with the predictor's levels combined. The
#'   predictor keeps its original position among the columns.
#'
#' @details Levels are matched exactly, not as regular expressions. Only the
#'   selected levels are renamed; other levels are left untouched even when
#'   their names contain the selected name as a substring.
#'   Unselected explicit \code{NA} levels and missing codes are preserved, as is
#'   the ordered class. A combined level takes the position of its first selected
#'   level; a new level for missing codes alone is appended at the end.
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

  variable <- column_name(substitute(var), parent.frame(), data)

  rbin_factor_combine_impl(data     = data,
                           var      = variable,
                           new_var  = new_var,
                           new_name = new_name)

}

#' Factor binning
#'
#' Weight of evidence and information value for categorical data.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param response Bare column name, character name, or variable holding a character
#'   name in \code{data}. A binary variable coded as 0/1, a logical
#'   variable, or a two-level factor/character. For a two-level factor the first
#'   level is treated as 0 and the second as 1.
#'   A character response is sorted in byte (C-locale) order: uppercase before
#'   lowercase, ASCII before accented characters; use a factor to choose the event level.
#'   The second value is the event.
#'   Rows with a missing response are dropped with a warning.
#' @param predictor Bare column name, character name, or variable holding a character
#'   name in \code{data}. A categorical predictor variable.
#'   Factor (including ordered), character, numeric, logical, \code{Date} and
#'   \code{POSIXct} columns are supported. Distinct values form distinct groups.
#' @param include_na logical; if \code{TRUE}, a separate bin is created for missing values.
#' @param x An object of class \code{rbin_factor}.
#' @param print_plot logical; if \code{TRUE}, prints the plot else returns a plot object.
#' @param ... further arguments passed to or from other methods.
#'
#' @return A list of class \code{rbin_factor} with the following elements:
#'   \code{bins}, a \code{data.frame} with one row per observed level (plus a
#'   final row for missing values when present); \code{method}; and \code{vars}.
#'
#' @details Both \code{response} and \code{predictor} accept bare column names,
#'   character names, or variables holding character names. Groups and cumulative
#'   counts follow first appearance, with missing values last. Factor levels and
#'   the ordered class are preserved; an explicit \code{NA} level is a valid
#'   category, distinct from a missing factor code. It precedes the final
#'   missing-code group and is retained when \code{include_na = FALSE}.
#'   Numeric \code{NaN} and \code{NA} share a missing-value group.
#'   If a literal \code{"NA"} category or an explicit \code{NA} level is present,
#'   the genuine missing group displays as \code{"(missing)"} in printed
#'   summaries and plots. Stored
#'   typed labels, explicit \code{NA} levels and ordered classes are preserved.
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

  rbin_factor_impl(data       = data,
                   response   = column_name(substitute(response), parent.frame(), data),
                   predictor  = column_name(substitute(predictor), parent.frame(), data),
                   include_na = include_na)

}

#' @export
#'
print.rbin_factor <- function(x, ...) {

  rbin_print_custom(x)
  cat("\n\n")
  bins <- x$bins[c('level', 'bin_count', 'good', 'bad', 'woe', 'iv', 'entropy')]
  bins$level <- factor_display_labels(bins$level, preserve_type = TRUE)
  print(bins)
}

# Keep typed summary labels intact, including explicit NA factor levels.
factor_display_labels <- function(level, preserve_type = FALSE) {
  labels <- as.character(level)
  missing <- is.na(level)
  na_category <- !missing & (is.na(labels) | labels == "NA")
  disambiguate <- any(missing) && any(na_category)
  if (preserve_type && !disambiguate) return(level)
  if (disambiguate) {
    labels[missing] <- "(missing)"
  }
  labels[is.na(labels)] <- "NA"
  labels
}

#' @import ggplot2
#' @rdname rbin_factor
#' @export
#'
plot.rbin_factor <- function(x, print_plot = TRUE,...) {

  xseq <- nrow(x$bins)
	xaxis_breaks <- seq_len(xseq)
	xaxis_labels <- factor_display_labels(x$bins$level)

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
#' @param predictor Bare column name, character name, or variable holding a character
#'   name in \code{data}. It can be a factor or a character variable;
#'   character variables are converted to
#'   a factor first, so the levels are sorted.
#'
#' @return A \code{data.frame} with the original columns preserved and one
#'   indicator column per level, appended at the end.
#'
#' @details Indicator columns are derived from the factor codes, so a factor
#'   with an explicit \code{NA} level gets a real indicator column (for example
#'   \code{g_NA}) and not a column of missings. A missing factor code that is
#'   not a level produces missing indicators. Generated names never overwrite
#'   existing columns: a collision is made unique by appending a suffix.
#'
#' @examples
#' upper <- c("secondary", "tertiary")
#' out <- rbin_factor_combine(mbank, education, upper, "upper")
#' rbin_factor_create(out, education)
#'
#' @export
#'
rbin_factor_create <- function(data, predictor) {

  data <- as.data.frame(data)

  variable <- column_name(substitute(predictor), parent.frame(), data)

  if (!is.character(variable) || length(variable) != 1L || is.na(variable)) {
    stop("`predictor` must be the name of a column in `data`", call. = FALSE)
  }

  if (!variable %in% names(data)) {
    stop("variable '", variable, "' not found in data", call. = FALSE)
  }

  x <- data[[variable]]

  if (is.character(x)) {
    x <- factor(x)
  }

  if (!is.factor(x)) {
    stop("`predictor` must be a factor or character variable", call. = FALSE)
  }

  levels_x <- levels(x)
  codes    <- as.integer(x)

  if (length(levels_x) == 0L) return(data)

  new_columns <- lapply(seq_along(levels_x), function(i) as.integer(codes == i))
  names(new_columns) <- paste0(variable, "_", levels_x)

  # never overwrite an existing column with a generated indicator
  all_names <- make.unique(c(names(data), names(new_columns)), sep = "_")
  names(new_columns) <- tail(all_names, length(new_columns))

  data[names(new_columns)] <- new_columns

  data

}
