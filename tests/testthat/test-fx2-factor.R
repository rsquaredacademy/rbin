test_that("A2-H03 / Hydrogen H3 M4 M5: factor codes retain both NA kinds and order", {
  g <- factor(c("a", "a", NA, NA, "b", "b"), exclude = NULL)
  is.na(g)[6] <- TRUE
  for (ordered in c(FALSE, TRUE)) {
    if (ordered) class(g) <- c("ordered", "factor")
    d <- data.frame(y = rep(0:1, 3), g = g)
    b <- rbin_factor(d, y, g)
    fx2_expect_summary(b, d$y, c(1, 1, 3, 3, 2, 4))
    expect_equal(as.integer(b$bins$level), c(1L, 2L, 3L, NA_integer_))
    expect_identical(levels(b$bins$level), levels(g))
    expect_identical(is.ordered(b$bins$level), ordered)
    no_missing <- rbin_factor(d, y, g, include_na = FALSE)
    expect_equal(no_missing$bins$bin_count, c(2L, 1L, 2L))
    expect_false(anyNA(no_missing$bins$level))
  }
  d <- data.frame(y = c(0, 1, 0, 1), g = factor(c("a", "b", NA), exclude = NULL)[1:4])
  fx2_expect_summary(rbin_factor(d, y, g), d$y, 1:4)
})

test_that("A2-H04 / Hydrogen H1: typed category keys never join on display text", {
  fixtures <- list(
    list(y = c(0, 1, 0, 0, 0, 1), g = c(1, 1, rep(1 + 1e-15, 3), 2), id = c(1, 1, 2, 2, 2, 3)),
    list(y = c(0, 0, 1, 1), g = c(1e10, 1e10, 1e10 + 1e-5, 1e10 + 1e-5), id = c(1, 1, 2, 2)),
    list(y = c(0, 1, 0, 1, 0, 1), g = c(1, 1, 1 + 1e-15, 1 + 1e-15, 2, 2), id = c(1, 1, 2, 2, 3, 3)))
  for (f in fixtures) {
    d <- data.frame(y = f$y, g = f$g)
    b <- rbin_factor(d, y, g)
    fx2_expect_summary(b, d$y, f$id)
    expect_identical(b$bins$level, unique(d$g))
  }
  t <- as.POSIXct("2020-01-01", tz = "UTC") + c(.1, .1, .2, .2)
  for (g in list(t, as.Date(c(1, 1, 2, 2), origin = "1970-01-01"), c(FALSE, FALSE, TRUE, TRUE))) {
    d <- data.frame(y = c(0, 0, 1, 1), g = g)
    fx2_expect_summary(rbin_factor(d, y, g), d$y, c(1, 1, 2, 2))
  }
})

test_that("Hydrogen H2: NaN and NA predictor rows share a conserved missing bin", {
  fixtures <- list(
    list(y = c(0, 1, 0, 1), g = c(1, 1, NaN, NaN), id = c(1, 1, 2, 2)),
    list(y = c(0, 1, 0, 0, 1, 1), g = c(1, 1, NaN, NaN, NA, NA), id = c(1, 1, 2, 2, 2, 2)),
    list(y = 0:1, g = c(NaN, NaN), id = c(1, 1)),
    list(y = c(0, 1, 0, 1), g = c(NaN, 1, NA, 1), id = c(2, 1, 2, 1)))
  for (f in fixtures) {
    d <- data.frame(y = f$y, g = f$g)
    b <- rbin_factor(d, y, g)
    fx2_expect_summary(b, d$y, f$id)
    expect_true(is.na(tail(b$bins$level, 1)))
    if (any(!is.na(d$g))) {
      expect_equal(sum(rbin_factor(d, y, g, FALSE)$bins$bin_count), sum(!is.na(d$g)))
    }
  }
})

test_that("A2-M01 / Hydrogen H4 H5 M5: combining remaps codes and NA consistently", {
  for (explicit in c(FALSE, TRUE)) {
    g <- factor(c("a", "b", NA), exclude = if (explicit) NULL else NA)
    d <- data.frame(g = g[1:4])
    unchanged <- rbin_factor_combine(d, g, "a", "A")$g
    expect_identical(is.na(unchanged), is.na(d$g))
    expect_identical(levels(unchanged), c("A", "b", if (explicit) NA_character_))
    for (selected in list(NA_character_, c("a", NA_character_))) {
      z <- rbin_factor_combine(d, g, selected, "missing")$g
      expect_equal(as.character(z), c(if (length(selected) == 2) "missing" else "a", "b", "missing", "missing"))
      expect_false(anyNA(z))
    }
  }
  d <- data.frame(g = ordered(c("low", "mid", "high"), levels = c("low", "mid", "high")))
  z <- rbin_factor_combine(d, g, c("low", "mid"), "L")$g
  expect_true(is.ordered(z))
  expect_equal(levels(z), c("L", "high"))
  expect_equal(as.integer(z), c(1L, 1L, 2L))
  expect_true(is.ordered(rbin_factor_combine(d, g, "low", "L")$g))
})

test_that("A2-M02 / Hydrogen M1: zero level predictors append zero dummy columns", {
  for (g in list(factor(), character(), factor(c(NA, NA)), c(NA_character_, NA_character_))) {
    d <- data.frame(g = g)
    expect_identical(rbin_factor_create(d, g), d)
  }
  d <- data.frame(g = factor(character(), levels = c("a", "b")))
  expect_equal(names(rbin_factor_create(d, g)), c("g", "g_a", "g_b"))
})

test_that("Hydrogen M2: factor arguments resolve bare, string and indirect column names", {
  d <- data.frame(y = c(0, 1, 0, 1), g = factor(c("a", "a", "b", "b")))
  ref <- rbin_factor(d, y, g)
  expect_identical(rbin_factor(d, "y", "g"), ref)
  rv <- "y"; pv <- "g"
  expect_identical(rbin_factor(d, rv, pv), ref)
  long <- paste(rep("non syntactic name", 8), collapse = " ")
  names(d)[2] <- long
  expr <- substitute(rbin_factor(d, y, COL), list(COL = as.name(long)))
  expect_equal(eval(expr)$bins, ref$bins)
})

test_that("A2-M04 / Hydrogen M3: response coding retains declared binary levels and drops NA levels", {
  for (value in c("no", "yes")) {
    d <- data.frame(y = factor(rep(value, 4), levels = c("no", "yes")), x = 1:4, g = c("a", "a", "b", "b"))
    methods <- list(function() rbin_manual(d, y, x, 2.5), function() rbin_equal_length(d, y, x, 2),
      function() rbin_quantiles(d, y, x, 2), function() rbin_winsorize(d, y, x, 2),
      function() rbin_equal_freq(d, y, x, 2), function() rbin_factor(d, y, g))
    for (f in methods) fx2_expect_summary(f(), rep(as.integer(value == "yes"), 4), c(1, 1, 2, 2))
  }
  for (ordered in c(FALSE, TRUE)) {
    d <- data.frame(y = factor(c("no", "yes", NA), exclude = NULL, ordered = ordered), g = factor(c("a", "b", "a")))
    expect_warning(b <- rbin_factor(d, y, g), "Dropping 1 row")
    fx2_expect_summary(b, 0:1, 1:2)
    d$y <- factor(c("no", "no", NA), exclude = NULL)
    expect_error(rbin_factor(d, y, g), "factor has 1 level")
  }
  d <- data.frame(y = factor(c("no", "yes", NA), exclude = NULL)[1:4], g = c("a", "b", "a", "b"))
  expect_warning(b <- rbin_factor(d, y, g), "Dropping 2 rows")
  fx2_expect_summary(b, 0:1, 1:2)
})

test_that("Hydrogen M6: factor plot labels identify missing bins", {
  for (g in list(factor(c("a", "a", "b", "b", NA, NA)),
                 factor(c("a", "a", "b", "b", NA, NA), exclude = NULL))) {
    d <- data.frame(y = rep(0:1, 3), g = g)
    p <- plot(rbin_factor(d, y, g), print_plot = FALSE)
    expect_equal(ggplot2::ggplot_build(p)$layout$panel_params[[1]]$x$get_labels(), c("a", "b", "NA"))
  }
})
