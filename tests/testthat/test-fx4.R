test_that("rx2h-H1: quantiles reject NaN cuts from opposite infinities", {
  d <- data.frame(y = c(0, 1, 0, 1), x = c(-Inf, -Inf, Inf, Inf))
  for (bins in c(2, 4)) {
    for (include_na in c(FALSE, TRUE)) {
      expect_error(rbin_quantiles(d, y, x, bins, include_na),
                   "computed cut points contain NA or NaN", fixed = TRUE)
    }
  }
})

test_that("rx2h-H1: valid single-infinity quantiles retain their memberships", {
  d <- data.frame(y = c(0, 1, 0, 1, 0), x = c(1, 2, 3, 4, Inf))
  for (include_na in c(FALSE, TRUE)) {
    b <- rbin_quantiles(d, y, x, 2, include_na)
    expect_equal(b$upper_cut, c(3, Inf))
    fx2_expect_summary(b, d$y, c(1, 1, 2, 2, 2), 2)
    expect_equal(unname(as.matrix(rbin_create(d, x, b)[-(1:2)])),
                 outer(c(1, 1, 2, 2, 2), 1:2, `==`) * 1L)
    expect_false(anyNA(b$bins$bin))
  }
  b <- rbin_quantiles(d, y, x, 5, FALSE)
  expect_equal(b$upper_cut, c(1.8, 2.6, 3.4, Inf, Inf))
  fx2_expect_summary(b, d$y, 1:5, 5)
  expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), rep(1, 5))
})

test_that("rx2h-H1: every other numeric method handles infinite predictors explicitly", {
  d <- data.frame(y = c(0, 1, 0, 1), x = c(-Inf, -Inf, Inf, Inf))
  for (bins in c(2, 4)) {
    expect_error(rbin_equal_length(d, y, x, bins, FALSE), "finite")
    expect_error(rbin_winsorize(d, y, x, bins, FALSE), "finite")
    b <- suppressMessages(rbin_equal_freq(d, y, x, bins))
    fx2_expect_summary(b, d$y, c(1, 1, 2, 2), 2)
    expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), c(2, 2))
    expect_false(anyNA(c(b$lower_cut, b$upper_cut)))
  }
  for (cuts in list(0, c(-Inf, 0, Inf))) {
    b <- rbin_manual(d, y, x, cuts, FALSE)
    expect_equal(b$bins$bin_count, if (length(cuts) == 1) c(2, 2) else c(0, 2, 0, 2))
    expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), b$bins$bin_count)
    expect_false(anyNA(c(b$lower_cut, b$upper_cut)))
    expect_false(anyNA(b$bins$bin))
  }
  expect_error(rbin_manual(d, y, x, NaN), "numeric vector of cut points")
})

test_that("rx2h-H1: numeric assignment never treats an unmatched value as missing", {
  expect_error(rbin:::numeric_bin_id(1, 0, NaN), "cut points contain NA or NaN")
  expect_error(rbin:::numeric_bin_id(1, NA_real_, Inf), "cut points contain NA or NaN")
  expect_error(rbin:::numeric_bin_id(1, 2, 3), "non-missing predictor values")
  expect_error(rbin:::numeric_bin_id(1, numeric(), numeric()), "non-missing predictor values")
  expect_identical(rbin:::numeric_bin_id(c(NA, NaN), 0, 1), c(NA_integer_, NA_integer_))
})

test_that("rx2h-L1: final equal-frequency dummy boundary retains shared precision", {
  d <- data.frame(y = rep(0:1, 3),
                  x = c(1, 1, 1 + 1e-15, 1 + 1e-15, 1 + 2e-15, 1 + 2e-15))
  b <- rbin_equal_freq(d, y, x, 3)
  out <- rbin_create(d, x, b)
  expect_identical(names(out), c("y", "x", "x_<_1.0000000000000011",
                                "x_<_1.000000000000002", "x_>=_1.000000000000002"))
  expect_equal(unname(as.matrix(out[-(1:2)])), outer(rep(1:3, each = 2), 1:3, `==`) * 1L)
})

test_that("rx2h-L2 / rx2d-L1: numeric APIs resolve bare, string, indirect and long names", {
  d <- data.frame(y = rep(0:1, 4), x = 1:8)
  rv <- "y"
  pv <- "x"
  methods <- list(rbin_manual, rbin_equal_length, rbin_quantiles, rbin_winsorize, rbin_equal_freq)
  for (fun in methods) {
    arg <- if (identical(fun, rbin_manual)) 4.5 else 2
    ref <- fun(d, y, x, arg)
    expect_identical(fun(d, "y", "x", arg), ref)
    expect_identical(fun(d, rv, pv, arg), ref)
    expect_identical(rbin_create(d, "x", ref), rbin_create(d, x, ref))
    expect_identical(rbin_create(d, pv, ref), rbin_create(d, x, ref))
    long <- d
    names(long) <- paste(c("response", "predictor"), paste(rep("non syntactic name", 8), collapse = " "))
    rv_long <- names(long)[1]
    pv_long <- names(long)[2]
    bare <- eval(substitute(fun(long, RESP, PRED, arg),
                            list(RESP = as.name(rv_long), PRED = as.name(pv_long))))
    expect_identical(fun(long, rv_long, pv_long, arg), bare)
    expect_identical(do.call(fun, list(long, rv_long, pv_long, arg)), bare)
    expect_identical(bare$bins, ref$bins)
    scored <- eval(substitute(rbin_create(long, PRED, bare), list(PRED = as.name(pv_long))))
    expect_identical(rbin_create(long, pv_long, bare), scored)
    expect_identical(do.call(rbin_create, list(long, pv_long, bare)), scored)
    expect_identical(unname(as.matrix(scored[-(1:2)])),
                     unname(as.matrix(rbin_create(d, x, ref)[-(1:2)])))
  }
})

test_that("rx2h-L3: manual display bounds stay ordered outside the observed range", {
  d <- data.frame(y = rep(0:1, 2), x = 1:4)
  for (cuts in list(c(-10, 0), c(5, 10), c(-10, 10))) {
    b <- rbin_manual(d, y, x, cuts)
    expect_true(all(b$lower_cut <= b$upper_cut))
    expect_equal(b$lower_cut[1], min(min(d$x), cuts[1]))
    expect_equal(tail(b$upper_cut, 1), max(max(d$x) + 1, tail(cuts, 1)))
    expect_equal(b$bins$bin_count, if (max(cuts) <= 0) c(0, 0, 4) else
                   if (min(cuts) >= 5) c(4, 0, 0) else c(0, 4, 0))
    expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), b$bins$bin_count)
  }
})

test_that("rx2d-L2: literal NA and genuine missing bins have distinct display labels", {
  for (g in list(c("NA", "NA", NA, NA), factor(c("NA", "NA", NA, NA)),
                 ordered(c("NA", "NA", NA, NA)))) {
    d <- data.frame(y = rep(0:1, 2), g = g)
    b <- rbin_factor(d, y, g)
    fx2_expect_summary(b, d$y, c(1, 1, 2, 2), 2)
    expect_identical(b$bins$level, g[c(1, 3)])
    expect_true(any(grepl("(missing)", capture.output(print(b)), fixed = TRUE)))
    labels <- ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels()
    expect_equal(labels, c("NA", "(missing)"))
    expect_false(any(grepl("(missing)", capture.output(print(rbin_factor(d, y, g, FALSE))), fixed = TRUE)))
  }
  # An explicit NA factor level is a category, not a missing factor code.
  g <- factor(c("NA", NA), exclude = NULL, ordered = TRUE)[c(1, 1, 2, 2, 3, 3)]
  d <- data.frame(y = rep(0:1, 3), g = g)
  b <- rbin_factor(d, y, g)
  expect_identical(b$bins$level, g[c(1, 3, 5)])
  expect_true(is.ordered(b$bins$level))
  expect_equal(ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
               c("NA", "NA", "(missing)"))
  ordinary <- rbin_factor(data.frame(y = rep(0:1, 2), g = c("a", "a", NA, NA)), y, g)
  expect_false(any(grepl("(missing)", capture.output(print(ordinary)), fixed = TRUE)))
  expect_equal(ggplot2::ggplot_build(plot(ordinary, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
               c("a", "NA"))
})
