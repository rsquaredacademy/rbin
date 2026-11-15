#' Create dummy variables
#'
#' Create dummy variables from bins.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#' @param predictor Variable for which dummy variables must be created.
#' @param bins An object of class \code{rbin_manual}, \code{rbin_quantiles},
#'   \code{rbin_equal_length}, \code{rbin_winsorize} or \code{rbin_equal_freq}.
#'
#' @return \code{data} with one indicator column per bin, appended in bin
#'   order. Every bin defined when the bins were created is represented, even
#'   when the data passed here has no observation in that bin.
#'
#' @details Missing predictor values produce missing indicators; the separate
#'   missing-value bin is not turned into a dummy column.
#'
#' @examples
#' k <- rbin_manual(mbank, y, age, c(29, 39, 56))
#' rbin_create(mbank, age, k)
#'
#' @export
#'
rbin_create <- function(data, predictor, bins) {

  data <- as.data.frame(data)

  pred <- column_name(substitute(predictor), parent.frame())

  if (!is.character(pred) || length(pred) != 1L || is.na(pred)) {
    stop("`predictor` must be the name of a column in `data`", call. = FALSE)
  }

  if (!pred %in% names(data)) {
    stop("predictor variable '", pred, "' not found in data", call. = FALSE)
  }

  x <- data[[pred]]

  if (!is.numeric(x)) {
    stop("predictor must be a numeric variable", call. = FALSE)
  }

  ranges <- bin_ranges(bins)

  if (is.null(ranges)) {
    return(data)
  }

  bin_id <- numeric_bin_id(x, ranges$lower, ranges$upper)

  result <- lapply(seq_along(ranges$lower), function(i) as.integer(bin_id == i))

  all_names <- make.unique(c(names(data), dummy_names(pred, ranges)),
                           sep = "_")
  names(result) <- tail(all_names, length(result))

  cbind(data, as.data.frame(result, optional = TRUE))

}

# Interval bounds used to score new data. The first interval is open on the
# left and the last one open on the right, so values outside the training range
# still receive a bin.
bin_ranges <- function(bins) {

  if (inherits(bins, "rbin_equal_freq")) {

    keep  <- !is.na(bins$bins$bin)
    lower <- bins$bins$lower_cut[keep]

    if (length(lower) == 0L) {
      return(NULL)
    }

    upper <- c(lower[-1L], Inf)

    # values below the training range still belong to the first group
    lower[1L] <- -Inf

    return(list(lower  = lower,
                upper  = upper,
                labels = paste0("<=", format_boundaries(bins$bins$upper_cut[keep]))))

  }

  lower <- bins$lower_cut
  upper <- bins$upper_cut

  if (length(lower) == 0L) {
    return(NULL)
  }

  cut_points <- bins$bins$cut_point
  labels     <- cut_points[seq_along(lower)]

  list(lower  = c(-Inf, lower[-1L]),
       upper  = upper,
       labels = labels)

}

dummy_names <- function(pred, ranges) {

  labels <- ranges$labels

  if (is.null(labels)) {
    return(paste0(pred, "_bin_", seq_along(ranges$lower)))
  }

  suffix <- sub("^< ", "<_", labels)
  suffix <- sub("^>= ", ">=_", suffix)

  paste0(pred, "_", suffix)

}
