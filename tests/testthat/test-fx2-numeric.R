test_that("A2-H01: scoring rejects rank groups split across tied values", {
  fixtures <- list(data.frame(y = rep(0:1, 3), x = rep(5, 6)),
                   data.frame(y = rep(0:1, 4), x = rep(c(0, 10), each = 4)),
                   data.frame(y = mbank$y, x = mbank$age))
  for (d in fixtures) {
    nb <- if (nrow(d) == 6) 3 else if (nrow(d) == 8) 3 else 10
    b <- rbin_equal_freq(d, y, x, nb)
    expect_equal(sum(b$bins$bin_count), nrow(d))
    expect_error(rbin_create(d, x, b), "ties.*bin boundaries")
    expect_error(rbin_create(d[0, ], x, b), "ties.*bin boundaries")
  }
  d <- data.frame(y = rep(0:1, 3), x = c(1, 2, 5, 6, 9, 10))
  b <- rbin_equal_freq(d, y, x, 3)
  expected <- outer(rep(1:3, each = 2), 1:3, `==`) * 1L
  expect_equal(unname(as.matrix(rbin_create(d, x, b)[-(1:2)])), expected)
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
