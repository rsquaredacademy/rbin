test_that("winsorized binning works as expected", {
  k <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("quantile binning works as expected", {
  k <- rbin_quantiles(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("manual binning works as expected", {
  k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal length binning works as expected", {
  k <- rbin_equal_length(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal frequency binning works as expected", {
  k <- rbin_equal_freq(mbank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("output from rbin_create is as expected as expected", {
  k <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  out <- rbin_create(mbank, age, k)
  expect_equal(ncol(out), 27)
})

test_that("output from rbin_factor_combine is as expected", {
  upper <- c("secondary", "tertiary")
  out <- rbin_factor_combine(mbank, education, upper, "upper")
  expect_equal(nlevels(out$education), 3)
})

test_that("output from rbin_factor is as expected", {
  bins <- rbin_factor(mbank, y, education)
  expect_equal(round(sum(bins$bins$iv), 2), 0.05)
})

test_that("output from rbin_factor_create is as expected", {
  upper <- c("secondary", "tertiary")
  out <- rbin_factor_combine(mbank, education, upper, "upper")
  result <- rbin_factor_create(out, education)
  expect_equal(ncol(result), 20)
})

test_that("output from rbin_print is as expected", {
  expect_snapshot(rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56)))
})

test_that("output from rbin_print_custom  is as expected", {
  expect_snapshot(rbin_factor(mbank, y, education))
})
