test_that("rx3-L1: explicit NA levels and missing codes have distinct display labels", {
  g <- structure(c(1L, 2L, 1L, NA_integer_),
                 levels = c("a", NA), class = "factor")
  d <- data.frame(y = c(0, 1, 0, 1), g = g)
  b <- rbin_factor(d, y, g)
  before <- b
  fx2_expect_summary(b, d$y, c(1, 2, 1, 3), 3)
  expect_identical(b$bins$level, g[c(1, 2, 4)])

  expected <- b$bins[c("level", "bin_count", "good", "bad", "woe", "iv", "entropy")]
  expected$level <- c("a", "NA", "(missing)")
  table_output <- capture.output(print(expected))
  expect_identical(tail(capture.output(print(b)), length(table_output)), table_output)
  expect_identical(ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
                   c("a", "NA", "(missing)"))
  expect_identical(b, before)

  without_missing <- rbin_factor(d, y, g, include_na = FALSE)
  expect_identical(without_missing$bins$level, g[1:2])
  expect_false(any(grepl("(missing)", capture.output(print(without_missing)), fixed = TRUE)))
  expect_identical(ggplot2::ggplot_build(plot(without_missing, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
                   c("a", "NA"))
})

test_that("rx3-L1: literal NA, explicit NA level and missing code retain three bins", {
  for (classes in list("factor", c("ordered", "factor"))) {
    g <- structure(c(1L, 2L, 1L, NA_integer_),
                   levels = c("NA", NA), class = classes)
    d <- data.frame(y = c(0, 1, 0, 1), g = g)
    b <- rbin_factor(d, y, g)
    before <- b
    fx2_expect_summary(b, d$y, c(1, 2, 1, 3), 3)
    expect_identical(b$bins$level, g[c(1, 2, 4)])

    expected <- b$bins[c("level", "bin_count", "good", "bad", "woe", "iv", "entropy")]
    expected$level <- c("NA", "NA", "(missing)")
    table_output <- capture.output(print(expected))
    expect_identical(tail(capture.output(print(b)), length(table_output)), table_output)
    expect_identical(ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
                     c("NA", "NA", "(missing)"))
    expect_identical(b, before)
  }
})

test_that("rx3-L1: ordinary printed summaries keep their typed level formatting", {
  for (g in list(c("a", NA, "a", NA), factor(c("a", NA, "a", NA)),
                 c(1, NA, 1, NA),
                 structure(c(1L, 1L, NA_integer_, NA_integer_),
                           levels = c("a", NA), class = "factor"))) {
    b <- rbin_factor(data.frame(y = c(0, 1, 0, 1), g = g), y, g)
    expected <- b$bins[c("level", "bin_count", "good", "bad", "woe", "iv", "entropy")]
    table_output <- capture.output(print(expected))
    expect_identical(tail(capture.output(print(b)), length(table_output)), table_output)
    expect_identical(ggplot2::ggplot_build(plot(b, print_plot = FALSE))$layout$panel_params[[1]]$x$get_labels(),
                     c(as.character(g[1]), "NA"))
  }
})
