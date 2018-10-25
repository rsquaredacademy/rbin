bin_create <- function(bm) {

  bm %>%
    arrange(predictor) %>%
    group_by(bin) %>%
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
    )

}

f_bin <- function(u_freq) {

  len_fbin <- length(u_freq)
  fbin <- u_freq[-len_fbin]
  l_fbin <- length(fbin)
  c(fbin, fbin[l_fbin])

}

create_intervals <- function(sym_sign, fbin2) {

  tibble(sym_sign, fbin2) %>%
    mutate(cut_point = paste(sym_sign, fbin2)) %>%
    select(cut_point)

}


freq_bin_create <- function(bm, bin_rep) {

  bm %>%
    arrange(predictor) %>%
    mutate(
      bin = bin_rep
    ) %>%
    group_by(bin) %>%
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
    )

}