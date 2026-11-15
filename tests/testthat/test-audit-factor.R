# Regression tests for the 0.2.2 pre-CRAN audit (categorical findings).

test_that("H05: factor levels are combined by exact name", {
  out <- rbin_factor_combine(data.frame(g = factor(c("a", "aa", "b"))),
                             g, "a", "z")
  expect_equal(as.character(out$g), c("z", "aa", "b"))

  out <- rbin_factor_combine(data.frame(g = factor(c("a", "b", "c"))),
                             g, c("a", "b"), "ab")
  expect_equal(as.character(out$g), c("ab", "ab", "c"))
  expect_equal(levels(out$g), c("ab", "c"))

  out <- rbin_factor_combine(data.frame(g = factor(c("a[", "b", "c"))),
                             g, "a[", "z")
  expect_equal(as.character(out$g), c("z", "b", "c"))

  # a replacement that matches an existing level merges the two levels once
  out <- rbin_factor_combine(data.frame(g = factor(c("a", "b", "c"))),
                             g, "a", "b")
  expect_equal(as.character(out$g), c("b", "b", "c"))
  expect_equal(levels(out$g), c("b", "c"))
})

test_that("H07: factor dummy creation keeps the original columns", {
  d <- data.frame(g = factor(c("a", "b", "a")), temp = 101:103)
  out <- rbin_factor_create(d, g)

  expect_equal(names(out), c("g", "temp", "g_a", "g_b"))
  expect_equal(out$temp, 101:103)
  expect_equal(out$g_a, c(1L, 0L, 1L))
  expect_equal(out$g_b, c(0L, 1L, 0L))

  d2 <- data.frame(temp = 101:103, g = factor(c("a", "b", "a")))
  out2 <- rbin_factor_create(d2, g)
  expect_equal(names(out2), c("temp", "g", "g_a", "g_b"))
  expect_equal(out2$temp, 101:103)
  expect_equal(out2$g_b, c(0L, 1L, 0L))

  # a generated name never overwrites an existing column
  d3 <- data.frame(g = factor(c("a", "b")), g_a = 1:2)
  out3 <- rbin_factor_create(d3, g)
  expect_equal(out3$g_a, 1:2)
  expect_equal(ncol(out3), 4L)
})

test_that("H08: character predictors get dummy columns", {
  d <- data.frame(g = c("a", "b", "a"))
  out <- rbin_factor_create(d, g)

  expect_equal(names(out), c("g", "g_a", "g_b"))
  expect_equal(out$g_a, c(1L, 0L, 1L))
  expect_equal(out$g_b, c(0L, 1L, 0L))
})

test_that("H09: an explicit NA factor level gets a real indicator", {
  d <- data.frame(g = factor(c("a", NA, "a"), exclude = NULL))

  expect_equal(levels(d$g), c("a", NA))
  out <- rbin_factor_create(d, g)

  expect_equal(names(out), c("g", "g_a", "g_NA"))
  expect_equal(out$g_a, c(1L, 0L, 1L))
  expect_equal(out$g_NA, c(0L, 1L, 0L))
  expect_equal(out$g_NA, as.integer(as.integer(d$g) == 2L))
})

test_that("factor binning keeps missing predictors in a final group", {
  d <- data.frame(y = rep(0:1, 5),
                  g = factor(c("a", "a", "b", "b", "c", "c", "a", "b",
                               NA, NA)))

  b <- rbin_factor(d, y, g)

  expect_equal(as.character(b$bins$level), c("a", "b", "c", NA))
  expect_equal(b$bins$bin_count, c(3L, 3L, 2L, 2L))
  expect_true(is.na(tail(b$bins$level, 1)))

  b2 <- rbin_factor(d, y, g, include_na = FALSE)
  expect_equal(b2$bins$bin_count, c(3L, 3L, 2L))
})
