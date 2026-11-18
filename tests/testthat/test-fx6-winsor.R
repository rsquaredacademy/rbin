test_that("fx6 opus M2/astra M8: winsor_rate is validated independently of endpoints", {
  d <- data.frame(y = 0:1, x = 1:4)
  for (rate in list(-0.1, 0.6, NA_real_, NaN, Inf, numeric(), c(.1, .2), "0.1", TRUE)) {
    for (ends in list(list(), list(min_val = 1), list(min_val = 1, max_val = 4))) {
      expect_error(do.call(rbin_winsorize,
        c(list(data = d, response = "y", predictor = "x", bins = 2,
               winsor_rate = rate), ends)), "winsor_rate.*single number.*0, 0.5")
    }
  }
  d$x <- rep(1, 4)
  expect_error(rbin_winsorize(d, y, x, 2, winsor_rate = .6), "winsor_rate")
  d$x <- 1:4
  expect_equal(rbin_winsorize(d, y, x, 2, winsor_rate = 0)$bins$bin_count, c(2, 2))
  expect_equal(rbin_winsorize(d, y, x, 2, winsor_rate = .5)$clamp, c(min = 2.5, max = 2.5))
})

test_that("fx6 opus M2: remove_na FALSE clearly diagnoses retained missing values", {
  for (x in list(c(NA, 2:4), c(NaN, 2:4), rep(NA_real_, 4))) {
    d <- data.frame(y = 0:1, x = x)
    expect_error(rbin_winsorize(d, y, x, 2, remove_na = FALSE), "remove_na = FALSE.*missing")
    expect_error(rbin_winsorize(d, y, x, 2, remove_na = FALSE, min_val = 1, max_val = 4),
                 "remove_na = FALSE.*missing")
  }
  d <- data.frame(y = 0:1, x = c(NA, 2:4))
  expect_equal(rbin_winsorize(d, y, x, 2, remove_na = FALSE, include_na = FALSE)$bins$bin_count,
               c(1L, 2L))
})
