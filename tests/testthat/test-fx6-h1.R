fx6_expect_membership <- function(d, b, group, n) {
  fx2_expect_summary(b, d$y, group, n)
  indicators <- as.matrix(rbin_create(d, x, b)[-(1:2)])
  expect_equal(unname(indicators), outer(group, seq_len(n), "==") * 1L)
}

test_that("fx6 H1: exact cuts assign observations to the left-closed bin", {
  d <- data.frame(x = c(0, 27, 29, 30, 58), y = c(0, 0, 1, 0, 1))
  for (b in list(rbin_equal_length(d, y, x, 14),
                 rbin_winsorize(d, y, x, 14, winsor_rate = 0))) {
    expect_identical(b$upper_cut[7], 29)
    expect_equal(b$bins$bin_count[7:8], c(1, 2))
    fx6_expect_membership(d, b, 1L + findInterval(d$x, 58 * (1:13) / 14), 14)
  }
  d <- data.frame(x = mbank$previous, y = mbank$y)
  # mbank's response is a binary factor; preserve its declared event coding.
  d$y <- as.integer(d$y) - 1L
  for (b in list(rbin_equal_length(d, y, x, 58),
                 rbin_winsorize(d, y, x, 58, winsor_rate = 0))) {
    expect_equal(b$bins$bin_count[29:30], c(0, 3))
    fx6_expect_membership(d, b, 1L + findInterval(d$x, 30 * (1:57) / 58), 58)
  }
})

test_that("fx6 H1: integer range grid agrees with independent ratio cuts", {
  ranges <- list(c(0L, 58L), c(-58L, 0L), c(-29L, 29L), c(1L, 59L),
                 c(-13L, 97L), c(0L, 30L), c(0L, 127L), c(17L, 76L))
  for (limits in ranges) {
    d <- data.frame(x = seq.int(limits[1], limits[2]))
    d$y <- rep(0:1, length.out = nrow(d))
    for (n in 2:60) {
      cuts <- min(d$x) + (max(d$x) - min(d$x)) * (1:(n - 1)) / n
      group <- 1L + findInterval(d$x, cuts)
      fx6_expect_membership(d, rbin_equal_length(d, y, x, n), group, n)
      fx6_expect_membership(d, rbin_winsorize(d, y, x, n, winsor_rate = 0), group, n)
    }
  }
})

test_that("fx6 H1/M6: integer and extreme spans retain valid membership", {
  d <- data.frame(x = c(-2000000000L, 0L, 2000000000L), y = c(0, 1, 0))
  expect_warning(b <- rbin_equal_length(d, y, x, 2), NA)
  fx6_expect_membership(d, b, c(1L, 2L, 2L), 2)
  for (values in list(c(-1e308, 0, 1e308), c(0, 5e307, 1e308))) {
    d$x <- values
    for (b in list(rbin_equal_length(d, y, x, 4),
                   rbin_winsorize(d, y, x, 4, winsor_rate = 0))) {
      expect_true(all(is.finite(b$lower_cut)))
      fx6_expect_membership(d, b, c(1L, 3L, 4L), 4)
    }
  }
})
