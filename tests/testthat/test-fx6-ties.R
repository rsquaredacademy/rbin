test_that("fx6 astra M9: heavy ties stay together and report fewer bins", {
  d <- data.frame(x = c(rep(1, 6), 2:3), y = rep(0:1, 4))
  expect_message(b <- rbin_equal_freq(d, y, x, 4), "4.*returning 2")
  expect_equal(b$bins$bin_count, c(6L, 2L))
  expect_equal(unname(colSums(rbin_create(d, x, b)[-(1:2)])), c(6, 2))
})
