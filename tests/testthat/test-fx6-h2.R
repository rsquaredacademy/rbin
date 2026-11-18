test_that("fx6 H2: every fitter and scorer reject classed numeric predictors", {
  d <- data.frame(y = rep(0:1, 4), x = as.double(1:8))
  fitters <- list(
    function(d) rbin_manual(d, y, x, 5),
    function(d) rbin_quantiles(d, y, x, 2),
    function(d) rbin_equal_freq(d, y, x, 2),
    function(d) rbin_equal_length(d, y, x, 2),
    function(d) rbin_winsorize(d, y, x, 2),
    function(d) rbin_factor(d, y, x))
  plain_fit <- rbin_manual(d, y, x, 5)
  for (numeric_class in c("integer64", "custom_numeric")) {
    # Class rejection must happen before consulting class-specific arithmetic.
    class(d$x) <- numeric_class
    diagnostic <- paste0("unsupported predictor class '", numeric_class, "'")
    for (fit in fitters[seq_len(5)]) expect_error(fit(d), diagnostic)
    if (numeric_class == "integer64") expect_error(fitters[[6]](d), diagnostic)
    expect_error(rbin_create(d, x, plain_fit), diagnostic)
    class(d$x) <- NULL
  }
  expect_equal(plain_fit$bins$bin_count, c(4L, 4L))
  expect_equal(colSums(rbin_create(d, x, plain_fit)[-(1:2)]),
               c("x_<_5" = 4, "x_>=_5" = 4))
})
