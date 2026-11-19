test_that("the package does not check for updates at attach", {
  expect_false(exists(".onAttach", envir = asNamespace("rbin"), inherits = FALSE))
})

test_that("include_na = FALSE works with a missing predictor", {
  set.seed(3)
  d <- data.frame(y = rep(0:1, 50), x = round(rnorm(100), 3))
  d$x[1] <- NA

  b <- rbin_winsorize(d, y, x, 5, include_na = FALSE)
  expect_equal(sum(b$bins$bin_count), 99)
  expect_equal(b$bins, rbin_winsorize(d[-1, ], y, x, 5, include_na = FALSE)$bins)
})

test_that("bins must be at least 2", {
  expect_error(rbin_quantiles(mbank, y, age, 1), "bins must be at least 2")
  expect_error(rbin_equal_length(mbank, y, age, 1), "bins must be at least 2")
  expect_error(rbin_winsorize(mbank, y, age, 1), "bins must be at least 2")
})

test_that("data.table input gives the same result as data.frame", {
  dt <- data.table::as.data.table(mbank)

  expect_equal(
    rbin_manual(dt, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))$bins,
    rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))$bins
  )
  expect_equal(
    rbin_equal_length(dt, y, age, 10)$bins,
    rbin_equal_length(mbank, y, age, 10)$bins
  )
  expect_equal(
    rbin_quantiles(dt, y, age, 10)$bins,
    rbin_quantiles(mbank, y, age, 10)$bins
  )
  expect_equal(
    rbin_winsorize(dt, y, age, 10, winsor_rate = 0.05)$bins,
    rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)$bins
  )
  expect_equal(
    rbin_equal_freq(dt, y, age, 10)$bins,
    rbin_equal_freq(mbank, y, age, 10)$bins
  )
  expect_equal(
    rbin_factor(dt, y, education)$bins,
    rbin_factor(mbank, y, education)$bins
  )

  k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  expect_equal(rbin_create(dt, age, k), rbin_create(mbank, age, k))

  upper <- c("secondary", "tertiary")
  expect_equal(
    rbin_factor_combine(dt, education, upper, "upper"),
    rbin_factor_combine(mbank, education, upper, "upper")
  )
  expect_equal(
    rbin_factor_create(rbin_factor_combine(dt, education, upper, "upper"), education),
    rbin_factor_create(rbin_factor_combine(mbank, education, upper, "upper"), education)
  )
})
