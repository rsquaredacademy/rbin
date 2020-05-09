bin_create <- function(bm) {

  bm %>%
    dplyr::arrange(predictor) %>%
    dplyr::group_by(bin) %>%
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
    )

}

f_bin <- function(u_freq) {

  len_fbin <- length(u_freq)
  fbin <- u_freq[-len_fbin]
  l_fbin <- length(fbin)
  c(fbin, fbin[l_fbin])

}

create_intervals <- function(sym_sign, fbin2) {

  tibble::tibble(sym_sign, fbin2) %>%
    dplyr::mutate(cut_point = paste(sym_sign, fbin2)) %>%
    dplyr::select(cut_point)

}


freq_bin_create <- function(bm, bin_rep) {

  bm %>%
    dplyr::arrange(predictor) %>%
    dplyr::mutate(
      bin = bin_rep
    ) %>%
    dplyr::group_by(bin) %>%
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
    )

}


plot_bins <- function(x) {
  
  xseq <- 
    x %>%
    magrittr::use_series(bins) %>%
    nrow()
  
  p <- 
    x %>%
    magrittr::use_series(bins) %>%
    ggplot2::ggplot() +
    ggplot2::geom_line(ggplot2::aes(x = bin, y = woe), color = "blue") +
    ggplot2::geom_point(ggplot2::aes(x = bin, y = woe), color = "red") +
    ggplot2::xlab("Bins") + ggplot2::ylab("WoE") + ggplot2::ggtitle("WoE Trend") +
    ggplot2::scale_x_continuous(breaks = seq(xseq))

  return(p)
  
}
