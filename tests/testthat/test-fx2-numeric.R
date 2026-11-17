test_that("A2-H01: tie-aware empirical quantiles reproduce training summaries", {
  fixtures <- list(
    list(x = rep(5, 6), bins = 3),
    list(x = mbank$age, y = mbank$y, bins = 10),
    list(x = mbank$age, y = mbank$y, bins = 5),
    list(x = c(rep(0, 70), 1:30), bins = 10),
    list(x = c(1:15, rep(16, 70), 17:31), bins = 10),
    list(x = c(1:30, rep(31, 70)), bins = 10))
  for (f in fixtures) {
    d <- data.frame(y = if (is.null(f$y)) rep(0:1, length.out = length(f$x)) else f$y,
                    x = f$x)
    b <- suppressMessages(rbin_equal_freq(d, y, x, f$bins))
    # Independent cumulative-count construction: the target value belongs
    # below the boundary, including every row tied at that value.
    values <- sort(unique(d$x))
    cumulative <- vapply(values, function(v) sum(d$x <= v), integer(1))
    q <- unique(vapply(seq_len(f$bins - 1L), function(k)
      values[which(cumulative >= k * nrow(d) / f$bins)[1]], numeric(1)))
    q <- q[q < max(values)]
    group <- vapply(d$x, function(v) 1L + sum(v > q), integer(1))
    n <- length(q) + 1L
    fx2_expect_summary(b, d$y, group, n)
    out <- rbin_create(d, x, b)[-(1:2)]
    expect_equal(unname(colSums(out)), b$bins$bin_count)
    expect_equal(unname(as.matrix(out)), outer(group, seq_len(n), `==`) * 1L)
    expect_true(all(b$bins$bin_count > 0))
    expect_true(all(vapply(split(group, d$x), function(g) length(unique(g)) == 1L,
                           logical(1))))
    cuts <- vapply(q, function(v) min(values[values > v]), numeric(1))
    expect_equal(b$lower_cut, c(-Inf, cuts))
    expect_equal(b$upper_cut, c(cuts, Inf))
    expect_equal(b$bins$lower_cut, b$lower_cut)
    expect_equal(b$bins$upper_cut, b$upper_cut)
    expect_equal(ncol(rbin_create(d[0, ], x, b)), 2L + n)
    # Ties and response totals must be independent of training row order.
    expect_equal(suppressMessages(rbin_equal_freq(d[nrow(d):1, ], y, x, f$bins)), b)
  }
})

test_that("A2-H01: collapsed quantile cuts report requested and actual bin counts", {
  d <- data.frame(y = rep(0:1, 3), x = rep(5, 6))
  expect_message(b <- rbin_equal_freq(d, y, x, 3),
                 "Requested 3 equal-frequency bins; returning 1 non-missing bin")
  expect_equal(names(rbin_create(d, x, b)), c("y", "x", "x_all"))
  d <- data.frame(y = rep(0:1, 50), x = c(rep(0, 70), 1:30))
  expect_message(b <- rbin_equal_freq(d, y, x, 10),
                 "Requested 10 equal-frequency bins; returning 4 non-missing bin")
  expect_equal(b$bins$bin_count, c(70, 10, 10, 10))
  # Ceiling targets put the quantile's ties below the cut (not above it).
  d <- data.frame(y = rep(0:1, 5), x = c(1, 2, 2, 2, 2, 2, 3, 4, 5, 6))
  expect_no_message(b <- rbin_equal_freq(d, y, x, 2))
  expect_equal(b$bins$bin_count, c(6, 4))
  expect_equal(b$upper_cut, c(3, Inf))
})

test_that("A2-H01: untied empirical quantiles differ in size by at most one", {
  for (n in c(9, 10, 23, 99, 100)) {
    for (nb in unique(c(1, 2, 6, n))) {
      d <- data.frame(y = rep(0:1, length.out = n), x = seq_len(n))
      expect_no_message(b <- rbin_equal_freq(d, y, x, nb))
      expect_equal(nrow(b$bins), nb)
      expect_lte(diff(range(b$bins$bin_count)), 1)
      expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), b$bins$bin_count)
    }
  }
})

test_that("A2-H01: ties retain missing predictors and supported frame inputs", {
  d <- data.frame(y = rep(0:1, 5), x = c(rep(2, 6), 3, 4, NA, NaN))
  expect_message(b <- rbin_equal_freq(d, y, x, 4), "returning 2 non-missing bin")
  fx2_expect_summary(b, d$y, c(rep(1L, 6), 2L, 2L, 3L, 3L), 3)
  expect_equal(b$bins$bin, c(1L, 2L, NA_integer_))
  expect_equal(tail(b$bins$lower_cut, 1), NA_real_)
  for (dd in list(d, tibble::as_tibble(d), data.table::as.data.table(d))) {
    expect_equal(suppressMessages(rbin_equal_freq(dd, y, x, 4)), b)
    out <- rbin_create(dd, x, b)[-(1:2)]
    expect_true(all(is.na(as.matrix(out)[9:10, ])))
    expect_equal(unname(colSums(out, na.rm = TRUE)), b$bins$bin_count[1:2])
  }
})

test_that("A2-H02: scoring applies the fitted winsor clamp even for collapsed ranges", {
  fixtures <- list(
    list(x = 1:10, args = list(winsor_rate = .5), lo = 5.5, hi = 5.5),
    list(x = 1:4, args = list(min_val = 10, max_val = 20), lo = 10, hi = 20),
    list(x = 1:4, args = list(min_val = -20, max_val = -10), lo = -20, hi = -10),
    list(x = c(1e16, 2e16), args = list(min_val = 1e16, max_val = 1e16),
         lo = 1e16, hi = 1e16))
  for (f in fixtures) {
    d <- data.frame(y = rep(0:1, length.out = length(f$x)), x = f$x)
    b <- do.call(rbin:::rbin_winsorize_impl,
      c(list(data = d, response = "y", predictor = "x", bins = 2), f$args))
    for (xx in list(d$x, c(-1e20, 0, f$x, 1e20, NA))) {
      clamped <- pmin(pmax(xx, f$lo), f$hi)
      group <- as.integer(cut(clamped, c(-Inf, b$upper_cut[1], Inf), right = FALSE))
      actual <- as.matrix(rbin_create(data.frame(x = xx), x, b)[-1])
      expect_equal(unname(actual), outer(group, 1:2, `==`) * 1L)
    }
    expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), b$bins$bin_count)
    expect_equal(unname(b$clamp), c(f$lo, f$hi))
    b$clamp <- NULL
    expect_error(rbin_create(d, x, b), "lack fitted clamp metadata")
  }
})

test_that("A2-H05: equal widths stay finite over overflowing finite ranges", {
  for (scale in c(1e308, 1.7e308)) {
    d <- data.frame(y = c(0, 0, 1, 0, 1, 1), x = c(-1, -1, -.5, .5, 1, 1) * scale)
    for (fun in list(rbin_equal_length, rbin_winsorize)) {
      b <- fun(d, y, x, 3)
      expect_true(all(is.finite(b$upper_cut[1:2])))
      fx2_expect_summary(b, d$y, c(1, 1, 1, 3, 3, 3), 3)
      expect_equal(unname(as.matrix(rbin_create(d, x, b)[-(1:2)])),
                   outer(c(1, 1, 1, 3, 3, 3), 1:3, `==`) * 1L)
    }
  }
  for (xx in list(c(-Inf, 1), c(1, Inf), c(-Inf, Inf))) {
    d <- data.frame(y = 0:1, x = xx)
    expect_error(rbin_equal_length(d, y, x, 2), "finite")
    expect_error(rbin_winsorize(d, y, x, 2), "finite")
  }
})

test_that("A2-H06: quantile probabilities preserve exact sample membership", {
  for (n in c(11, 16, 21)) {
    d <- data.frame(y = rep(0:1, length.out = n), x = seq_len(n))
    q <- unname(stats::quantile(d$x, (1:4) / 5))
    b <- rbin_quantiles(d, y, x, 5)
    expect_identical(b$upper_cut[1:4], q)
    group <- as.integer(cut(d$x, c(-Inf, q, Inf), right = FALSE))
    fx2_expect_summary(b, d$y, group, 5)
    expect_equal(unname(as.matrix(rbin_create(d, x, b)[-(1:2)])),
                 outer(group, 1:5, `==`) * 1L)
  }
})

test_that("A2-L01: equal frequency dummy names describe the scoring intervals", {
  for (xx in list(c(1, 2, 9, 10), c(-10, -5, 5, 10))) {
    d <- data.frame(y = rep(0:1, 2), x = xx)
    b <- rbin_equal_freq(d, y, x, 2)
    score <- data.frame(x = c(-100, xx, mean(xx[2:3]), 100))
    out <- rbin_create(score, x, b)
    cut <- xx[3]
    expect_equal(names(out)[-1], paste0("x_", c("<_", ">=_"), cut))
    expect_equal(out[[2]], as.integer(score$x < cut))
    expect_equal(out[[3]], as.integer(score$x >= cut))
  }
})
