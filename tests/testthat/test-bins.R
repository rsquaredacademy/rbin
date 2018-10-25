context("test-bins")

test_that("winsorized binning works as expected", {
  k <- rbin_winsorize(marketing_bank, y, age, 10, winsor_rate = 0.05)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("quantile binning works as expected", {
  k <- rbin_quantiles(marketing_bank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("manual binning works as expected", {
  k <- rbin_manual(marketing_bank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal length binning works as expected", {
  k <- rbin_equal_length(marketing_bank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})

test_that("equal frequency binning works as expected", {
  k <- rbin_equal_freq(marketing_bank, y, age, 10)
  expect_equal(sum(k$bins$bin_count), 4521)
})