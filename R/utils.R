#' @importFrom data.table data.table := setDF setorder .N
#' @importFrom stats na.omit
bin_create <- function(bm) {

  bm <- data.table(bm)
  setorder(bm, predictor)  # sort

  # group and summarize
  bm_group <- bm[, .(bin_count = .N,
                     good = sum(response == 1),
                     bad = sum(response == 0)),
                 by = bin]

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
  return(bm_group)

}

f_bin <- function(u_freq) {

  len_fbin <- length(u_freq)
  fbin     <- u_freq[-len_fbin]
  l_fbin   <- length(fbin)
  c(fbin, fbin[l_fbin])

}

create_intervals <- function(sym_sign, fbin2) {

  result <- data.frame(sym_sign, fbin2)
  result$cut_point <- paste(result$sym_sign, result$fbin2)
  result['cut_point']

}

freq_bin_create <- function(bm, bin_rep) {

  data <- bm[order(bm$predictor), ]
  data$bin <- bin_rep
  bin_create(data)

}

plot_bins <- function(x) {

  plot_data <- x$bins
  xseq <- nrow(plot_data)

  p <-
    ggplot(data = plot_data) +
    geom_line(aes(x = bin, y = woe), color = "blue") +
    geom_point(aes(x = bin, y = woe), color = "red") +
    xlab("Bins") + ylab("WoE") + ggtitle("WoE Trend") +
    scale_x_continuous(breaks = seq(xseq))

  return(p)

}


check_suggests <- function(pkg) {

  pkg_flag <- tryCatch(utils::packageVersion(pkg), error = function(e) NA)

  if (is.na(pkg_flag)) {

    msg <- message(paste0('\n', pkg, ' must be installed for this functionality.'))

    if (interactive()) {
      message(msg, "\nWould you like to install it?")
      if (utils::menu(c("Yes", "No")) == 1) {
        utils::install.packages(pkg)
      } else {
        stop(msg, call. = FALSE)
      }
    } else {
      stop(msg, call. = FALSE)
    }
  }

}

#' @importFrom stats quantile
#' @importFrom utils head tail
winsor <- function(x, min_val = NULL, max_val = NULL, probs = c(0.05, 0.95),
                   na.rm = TRUE, type = 7) {

  if (is.null(min_val)) {
    y <- quantile(x, probs = probs, type = type, na.rm = na.rm)
    x[x > y[2]] <- y[2]
    x[x < y[1]] <- y[1]
  } else {
    if (is.null(max_val)) {
      stop("Argument max_val is missing.", call. = FALSE)
    }
    z <- sort(x)
    min_replace <- max(head(z, min_val))
    max_replace <- min(tail(z, max_val))
    x[x < min_replace] <- min_replace
    x[x > max_replace] <- max_replace
  }

  return(x)
}

