test_that("missing predictors are labelled and counted in the last row", {
  set.seed(1)
  d <- data.frame(y = rep(0:1, 50), x = round(rnorm(100), 3))
  d$x[100] <- NA

  bins <- list(
    manual       = rbin_manual(d, y, x, c(-0.5, 0, 0.5)),
    equal_length = rbin_equal_length(d, y, x, 5),
    quantiles    = rbin_quantiles(d, y, x, 5),
    winsorize    = rbin_winsorize(d, y, x, 5)
  )

  for (nm in names(bins)) {
    b <- bins[[nm]]

    expect_equal(tail(b$bins$cut_point, 1), "NA", info = nm)
    expect_true(is.na(tail(b$bins$bin, 1)), info = nm)
    expect_equal(tail(b$bins$bin_count, 1), 1L, info = nm)

    # binning is done on the (possibly winsorized) predictor
    xw <- pmin(pmax(d$x, b$lower_cut[1]),
               b$upper_cut[length(b$upper_cut)] - 1)
    expected <- vapply(
      seq_along(b$lower_cut),
      function(i) sum(xw >= b$lower_cut[i] & xw < b$upper_cut[i], na.rm = TRUE),
      integer(1)
    )

    expect_equal(head(b$bins$bin_count, length(expected)), expected, info = nm)
  }
})

test_that("rbin_create puts winsorized tails in the outer bins", {
  w <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
  out <- rbin_create(mbank, age, w)
  dummies <- tail(names(out), 10)

  non_na <- !is.na(mbank$age)
  all_na <- apply(is.na(out[non_na, dummies]), 1, all)

  expect_false(any(all_na))
  expect_false(anyNA(rowSums(out[, dummies])))
  expect_true(all(rowSums(out[, dummies]) == 1))
})

test_that("equal frequency binning works with small n and many bins", {
  d9 <- data.frame(y = rep(0:1, length.out = 9), x = 1:9)
  b9 <- rbin_equal_freq(d9, y, x, 6)
  expect_equal(b9$bins$bin_count, c(1L, 1L, 1L, 1L, 1L, 4L))
  expect_equal(sum(b9$bins$bin_count), nrow(d9))

  d10 <- data.frame(y = rep(0:1, length.out = 10), x = 1:10)
  b10 <- rbin_equal_freq(d10, y, x, 6)
  expect_equal(b10$bins$bin_count, c(1L, 1L, 1L, 1L, 1L, 5L))
  expect_equal(sum(b10$bins$bin_count), nrow(d10))

  d3 <- data.frame(y = rep(0:1, length.out = 3), x = 1:3)
  expect_error(rbin_equal_freq(d3, y, x, 6), "number of observations")
})

test_that("missing responses are dropped with a warning in every method", {
  set.seed(2)
  d <- data.frame(y = c(NA, rep(0:1, 49)), x = round(rnorm(99), 3))
  d$xf <- cut(d$x, 3)

  calls <- list(
    manual       = function(dd) rbin_manual(dd, y, x, c(-0.5, 0, 0.5)),
    equal_length = function(dd) rbin_equal_length(dd, y, x, 5),
    quantiles    = function(dd) rbin_quantiles(dd, y, x, 5),
    winsorize    = function(dd) rbin_winsorize(dd, y, x, 5),
    equal_freq   = function(dd) rbin_equal_freq(dd, y, x, 5),
    factor       = function(dd) rbin_factor(dd, y, xf)
  )

  for (nm in names(calls)) {
    expect_warning(rows <- calls[[nm]](d), "Dropping 1 row", info = nm)
    complete <- calls[[nm]](d[-1, ])
    expect_equal(rows$bins, complete$bins, info = nm)
  }

  d2 <- rbind(d, d[1, ])
  expect_warning(rbin_quantiles(d2, y, x, 5), "Dropping 2 rows")
})
