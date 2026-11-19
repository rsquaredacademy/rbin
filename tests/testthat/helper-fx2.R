# Independent base-R reference, including every derived summary field.
fx2_reference <- function(y, group, n = max(group)) {
  count <- tabulate(group, n)
  good <- tabulate(group[y == 1], n)
  bad <- tabulate(group[y == 0], n)
  gd <- if (sum(good)) good / sum(good) else rep(NA_real_, n)
  bd <- if (sum(bad)) bad / sum(bad) else rep(NA_real_, n)
  entropy <- vapply(seq_len(n), function(i) {
    if (!count[i]) return(0)
    p <- c(good[i], bad[i]) / count[i]
    -sum(p[p > 0] * log2(p[p > 0]))
  }, numeric(1))
  out <- data.frame(bin_count = count, good = good, bad = bad,
    bin_cum_count = cumsum(count), good_cum_count = cumsum(good),
    bad_cum_count = cumsum(bad), bin_prop = count / sum(count),
    good_rate = good / count, bad_rate = bad / count,
    good_dist = gd, bad_dist = bd, woe = log(bd / gd),
    dist_diff = bd - gd, iv = (bd - gd) * log(bd / gd),
    entropy = entropy, prop_entropy = count / sum(count) * entropy)
  empty <- count == 0
  out[empty, c("good_rate", "bad_rate", "woe")] <- NA_real_
  out[empty, c("good_dist", "bad_dist", "dist_diff", "iv")] <- 0
  out
}

fx2_expect_summary <- function(b, y, group, n = max(group)) {
  ref <- fx2_reference(y, group, n)
  expect_equal(b$bins[names(ref)], ref, tolerance = 1e-12)
}
