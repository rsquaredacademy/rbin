# Regression tests for the 0.2.2 pre-CRAN audit (numeric binning findings).

test_that("H01: empty intervals keep zero counts instead of being recycled", {
  d <- data.frame(y = c(0, 0, 1, 0, 1, 1),
                  x = c(0, 0, 0, 10, 10, 10))

  b <- rbin_manual(d, y, x, c(2, 4, 6))

  expected <- as.integer(table(cut(d$x, c(-Inf, 2, 4, 6, Inf), right = FALSE)))

  expect_equal(b$bins$bin_count, expected)
  expect_equal(b$bins$bin, 1:4)
  expect_equal(sum(b$bins$bin_count), nrow(d))
  expect_equal(sum(b$bins$iv), 2 * log(2) / 3, tolerance = 1e-12)
  expect_equal(sum(b$bins$prop_entropy), 0.9182958340544896,
               tolerance = 1e-12)
  expect_equal(b$bins$woe[b$bins$bin_count == 0], c(NA_real_, NA_real_))
})

test_that("H01: every numeric method conserves the row count with empty bins", {
  d <- data.frame(y = c(0, 1, 0, 1), x = c(0, 0, 10, 10))

  calls <- list(
    manual = function() rbin_manual(d, y, x, c(2, 4, 6)),
    equal_length = function() rbin_equal_length(d, y, x, 4),
    quantiles = function() rbin_quantiles(d, y, x, 4),
    winsorize = function() rbin_winsorize(d, y, x, 4)
  )

  for (nm in names(calls)) {
    b <- calls[[nm]]()
    expect_equal(sum(b$bins$bin_count), 4L, info = nm)
    expect_equal(nrow(b$bins), 4L, info = nm)
    expect_true(any(b$bins$bin_count == 0L), info = nm)
  }

  b <- rbin_manual(d, y, x, c(2, 4, 6))
  expected <- as.integer(table(cut(d$x, c(-Inf, 2, 4, 6, Inf),
                                   right = FALSE)))
  expect_equal(b$bins$bin_count, expected)

  expect_error(rbin_equal_length(d, y, x, 3), NA)
  expect_equal(sum(rbin_equal_length(d, y, x, 3)$bins$bin_count), 4L)
})

test_that("H01: repeated quantile boundaries do not duplicate observations", {
  d <- data.frame(y = 0:1, x = c(5, 5))
  b <- rbin_quantiles(d, y, x, 4)

  expect_equal(sum(b$bins$bin_count), 2L)
  expect_equal(b$bins$bin_count, c(0L, 0L, 0L, 2L))

  b1 <- rbin_quantiles(data.frame(y = 1, x = 5), y, x, 4)
  expect_equal(sum(b1$bins$bin_count), 1L)
})

test_that("H01: winsorizing at the documented rate endpoint conserves rows", {
  d <- data.frame(y = rep(0:1, 5), x = 1:10)
  b <- rbin_winsorize(d, y, x, 2, winsor_rate = 0.5)

  expect_equal(sum(b$bins$bin_count), 10L)
  expect_equal(b$bins$bin_count, c(0L, 10L))
})

test_that("H01: an empty middle interval is labelled separately from NA", {
  d <- data.frame(y = rep(0:1, 3), x = c(0, 0, 10, 10, NA, NA))
  b <- rbin_manual(d, y, x, c(2, 4))

  expect_equal(b$bins$cut_point, c("< 2", "< 4", ">= 4", "NA"))
  expect_equal(b$bins$bin, c(1L, 2L, 3L, NA_integer_))
  expect_equal(b$bins$bin_count, c(2L, 0L, 2L, 2L))
})

test_that("H01: an all-missing predictor is a single missing group", {
  d <- data.frame(y = c(0, 1), x = c(NA_real_, NA_real_))

  calls <- list(
    manual = function() rbin_manual(d, y, x, 2.5),
    equal_length = function() rbin_equal_length(d, y, x, 2),
    quantiles = function() rbin_quantiles(d, y, x, 2),
    winsorize = function() rbin_winsorize(d, y, x, 2)
  )

  for (nm in names(calls)) {
    b <- calls[[nm]]()
    expect_equal(sum(b$bins$bin_count), 2L, info = nm)
    expect_equal(sum(b$bins$prop_entropy), 1, tolerance = 1e-12, info = nm)
    expect_equal(sum(b$bins$bin_count[is.na(b$bins$bin)]), 2L, info = nm)
    expect_equal(sum(b$bins$bin_count[!is.na(b$bins$bin)]), 0L, info = nm)
  }
})

test_that("H02: equal frequency binning balances the remainder", {
  d <- data.frame(y = rep(0:1, length.out = 99), x = 1:99)
  b <- rbin_equal_freq(d, y, x, 10)

  expect_equal(sort(b$bins$bin_count), c(9L, rep(10L, 9)))
  expect_equal(sum(b$bins$bin_count), 99L)
  expect_lte(max(b$bins$bin_count) - min(b$bins$bin_count), 1L)

  b2 <- rbin_equal_freq(data.frame(y = rep(0:1, length.out = 23), x = 1:23),
                        y, x, 5)
  expect_equal(sort(b2$bins$bin_count), c(4L, 4L, 5L, 5L, 5L))
  expect_equal(sum(b2$bins$bin_count), 23L)
})

test_that("H03: numeric dummy columns follow bin order", {
  d <- data.frame(y = rep(0:1, 3), x = c(0, 1, 3, 4, 11, 12))
  b <- rbin_manual(d, y, x, c(2, 10))
  out <- rbin_create(d, x, b)

  expect_equal(out$`x_<_2`, as.integer(d$x < 2))
  expect_equal(out$`x_<_10`, as.integer(d$x >= 2 & d$x < 10))
  expect_equal(out$`x_>=_10`, as.integer(d$x >= 10))
  expect_equal(unname(rowSums(out[c("x_<_2", "x_<_10", "x_>=_10")])),
               rep(1, nrow(d)))
})

test_that("H03: distinct boundaries that format alike stay distinct", {
  d <- data.frame(y = rep(0:1, 3),
                  x = c(0, 0.5, 1 + 4e-16, 1 + 6e-16, 1.1, 1.2))
  b <- rbin_manual(d, y, x, c(1, 1 + 1e-15))

  expect_equal(b$bins$bin_count, c(2L, 2L, 2L))
  expect_equal(anyDuplicated(b$bins$cut_point), 0L)

  out <- rbin_create(d, x, b)
  dummies <- setdiff(names(out), names(d))

  expect_length(dummies, 3L)
  expect_equal(unname(rowSums(out[dummies])), rep(1, nrow(d)))
  expect_equal(out[[dummies[2]]], c(0L, 0L, 1L, 1L, 0L, 0L))
})

test_that("H04: winsorization borders are values, not row counts", {
  d <- data.frame(y = rep(0:1, 5), x = seq(10, 100, 10))
  b <- rbin_winsorize(d, y, x, 2, min_val = 20, max_val = 80)

  xw <- pmin(pmax(d$x, 20), 80)
  expected <- as.integer(table(cut(xw, c(-Inf, 50, Inf), right = FALSE)))

  expect_equal(b$lower_cut[1], 20)
  expect_equal(tail(b$upper_cut, 1), 81)
  expect_equal(b$bins$bin_count, expected)
  expect_equal(b$bins$bin_count, c(4L, 6L))

  only_max <- rbin_winsorize(d, y, x, 2, max_val = 60)
  expect_equal(tail(only_max$upper_cut, 1), 61)

  only_min <- rbin_winsorize(d, y, x, 2, min_val = 20)
  expect_equal(only_min$lower_cut[1], 20)

  expect_error(rbin_winsorize(d, y, x, 2, min_val = 80, max_val = 20),
               "less than or equal")
})

test_that("H06: pure bins have zero entropy", {
  d <- data.frame(y = c(0, 0, 1, 1), x = 1:4,
                  g = factor(c("a", "a", "b", "b")))

  b <- rbin_manual(d, y, x, 3)
  expect_equal(b$bins$entropy, c(0, 0))
  expect_equal(sum(b$bins$prop_entropy), 0)

  bf <- rbin_factor(d, y, g)
  expect_equal(bf$bins$entropy, c(0, 0))

  bq <- rbin_equal_freq(d, y, x, 2)
  expect_equal(bq$bins$entropy, c(0, 0))
  expect_equal(sum(bq$bins$prop_entropy), 0)

  printed <- capture.output(print(bq))
  expect_true(any(grepl("Entropy +0 *$", printed)))
})

test_that("H11: large finite maxima are not treated as missing", {
  d <- data.frame(y = rep(0:1, 2), x = c(1e16, 1e16, 2e16, 2e16))
  expected <- as.integer(d$x >= 1.5e16) + 1L

  calls <- list(
    manual = function() rbin_manual(d, y, x, 1.5e16),
    equal_length = function() rbin_equal_length(d, y, x, 2),
    quantiles = function() rbin_quantiles(d, y, x, 2),
    winsorize = function() rbin_winsorize(d, y, x, 2)
  )

  for (nm in names(calls)) {
    b <- calls[[nm]]()
    expect_equal(b$bins$bin, c(1L, 2L), info = nm)
    expect_equal(b$bins$bin_count, c(2L, 2L), info = nm)
    expect_false(anyNA(b$bins$bin), info = nm)
    expect_equal(b$bins$cut_point[2], ">= 1.5e+16", info = nm)
  }
})

test_that("H12: binary responses with other labels keep their class counts", {
  d <- data.frame(y = factor(c("no", "yes", "no", "yes")),
                  g = factor(c("a", "a", "b", "b")),
                  x = 1:4)

  bf <- rbin_factor(d, y, g)
  expect_equal(bf$bins$bin_count, c(2L, 2L))
  expect_equal(bf$bins$good, c(1L, 1L))
  expect_equal(bf$bins$bad, c(1L, 1L))
  expect_equal(bf$bins$woe, c(0, 0))
  expect_equal(bf$bins$iv, c(0, 0))

  bm <- rbin_manual(d, y, x, 2.5)
  expect_equal(bm$bins$good, c(1L, 1L))
  expect_equal(bm$bins$bad, c(1L, 1L))
  expect_equal(bm$bins$woe, c(0, 0))

  # character responses and factors with unused levels are accepted
  dc <- data.frame(y = c("no", "yes", "no", "yes"), x = 1:4)
  expect_equal(rbin_manual(dc, y, x, 2.5)$bins$good, c(1L, 1L))

  du <- data.frame(y = factor(c("no", "yes", "no", "yes"),
                              levels = c("no", "yes", "unused")),
                   x = 1:4)
  expect_equal(rbin_manual(du, y, x, 2.5)$bins$bad, c(1L, 1L))

  expect_error(rbin_manual(data.frame(y = c(0, 1, 2), x = 1:3), y, x, 2),
               "binary")
})

test_that("H15: numeric WoE plots include the missing-value bin", {
  d <- data.frame(y = rep(0:1, 3), x = c(1, 2, 3, 4, NA, NA))
  b <- rbin_manual(d, y, x, 2.5)

  p <- plot(b, print_plot = FALSE)
  built <- ggplot2::ggplot_build(p)

  expect_equal(built$data[[2]]$x, c(1, 2, 3))
  expect_equal(built$data[[2]]$y, b$bins$woe)
  expect_equal(p$data$cut_point, c("< 2.5", ">= 2.5", "NA"))
  expect_equal(nrow(p$data), 3L)
})

test_that("equal frequency binning keeps missing predictors in a final group", {
  d <- data.frame(y = rep(0:1, 5), x = c(1:8, NA, NA))
  b <- rbin_equal_freq(d, y, x, 3)

  expect_equal(b$bins$bin, c(1L, 2L, 3L, NA_integer_))
  expect_equal(b$bins$bin_count, c(3L, 3L, 2L, 2L))
  expect_equal(sum(b$bins$bin_count), nrow(d))
})

test_that("rbin_create supports equal frequency bins", {
  e <- rbin_equal_freq(data.frame(y = rep(0:1, 5), x = 1:10), y, x, 3)
  out <- rbin_create(data.frame(x = c(0, 4, 5, 9, 10, 20)), x, e)

  dummies <- setdiff(names(out), "x")
  expect_length(dummies, 3L)
  expect_equal(unname(rowSums(out[dummies])), rep(1, 6))
  expect_equal(out[[dummies[1]]], c(1L, 1L, 0L, 0L, 0L, 0L))
})
