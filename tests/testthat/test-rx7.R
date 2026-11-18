test_that("rx7 R7-H1: difftime predictors are refused by numeric methods and rbin_create()", {
  t0 <- as.POSIXct("2026-01-01", tz = "UTC")
  train <- data.frame(y = rep(0:1, 5))
  train$x <- (t0 + (1:10) * 86400) - t0
  expect_error(rbin_equal_length(train, y, x, 2), "difftime")
  expect_error(rbin_manual(train, y, x, 5), "difftime")
  num <- data.frame(y = rep(0:1, 5), x = 1:10)
  fit <- rbin_equal_length(num, y, x, 2)
  expect_error(rbin_create(train, x, fit), "difftime")
  expect_silent(rbin_factor(train, y, x))
})

test_that("rx7 R7-L2: rbin_create() points factor predictors to rbin_factor_create()", {
  num <- data.frame(y = rep(0:1, 4), x = 1:8)
  fit <- rbin_equal_length(num, y, x, 2)
  fac <- data.frame(y = rep(0:1, 4), x = factor(1:8))
  expect_error(rbin_create(fac, x, fit), "rbin_factor_create", fixed = TRUE)
})
