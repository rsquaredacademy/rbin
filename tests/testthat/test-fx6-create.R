test_that("fx6 astra M7: rbin_create rejects incompatible fit objects", {
  d <- data.frame(x = 1:4, y = 0:1)
  for (bad in list(rbin_factor(d, y, x), list(1, 2), NULL, 2, data.frame(x = 1))) {
    expect_error(rbin_create(d, x, bad), "bins.*numeric rbin fit object")
  }
  for (b in list(rbin_manual(d, y, x, 2.5), rbin_quantiles(d, y, x, 2),
                 rbin_equal_freq(d, y, x, 2), rbin_equal_length(d, y, x, 2),
                 rbin_winsorize(d, y, x, 2))) {
    expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), c(2, 2))
  }
  d$x <- NA_real_
  for (b in list(rbin_quantiles(d, y, x, 2), rbin_equal_length(d, y, x, 2),
                 rbin_winsorize(d, y, x, 2))) {
    expect_identical(rbin_create(d, x, b), d)
  }
})
