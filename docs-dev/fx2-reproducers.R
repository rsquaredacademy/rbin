# Run from the repository root: Rscript docs-dev/fx2-reproducers.R
# Pass --installed to verify the package in R_LIBS_USER instead of the source.
if ("--installed" %in% commandArgs(TRUE)) library(rbin) else devtools::load_all(".")
options(digits = 16)
verify <- function(id, actual, expected) {
  cat("\n", id, "\nactual:   ", sep = "")
  dput(actual)
  cat("expected: "); dput(expected)
  stopifnot(isTRUE(all.equal(actual, expected, check.attributes = FALSE,
                            tolerance = 1e-10)))
}
error_text <- function(expr) tryCatch({force(expr); "NO ERROR"}, error = conditionMessage)
counts <- function(b) unname(as.matrix(b$bins[c("bin_count", "good", "bad")]))

d <- data.frame(y = rep(0:1, 3), x = rep(5, 6))
b <- rbin_equal_freq(d, y, x, 3)
verify("A2-H01 learned counts", b$bins$bin_count, 6)
verify("A2-H01 scoring", colSums(rbin_create(d, x, b)[-(1:2)]), 6)
b <- rbin_equal_freq(mbank, y, age, 10)
verify("A2-H01 mbank counts", b$bins$bin_count,
       c(521, 386, 582, 374, 497, 396, 461, 474, 441, 389))
verify("A2-H01 mbank scoring", colSums(rbin_create(mbank, age, b)[-seq_along(mbank)]),
       b$bins$bin_count)

d <- data.frame(y = rep(0:1, 5), x = 1:10)
b <- rbin_winsorize(d, y, x, 2, winsor_rate = .5)
verify("A2-H02 collapsed clamp", colSums(rbin_create(d, x, b)[-(1:2)]), c(0, 10))
d <- data.frame(y = rep(0:1, 2), x = 1:4)
b <- rbin_winsorize(d, y, x, 2, min_val = 10, max_val = 20)
verify("A2-H02 above data", colSums(rbin_create(d, x, b)[-(1:2)]), c(0, 4))

g <- factor(c("a", "a", NA, NA, "b", "b"), exclude = NULL)
is.na(g)[6] <- TRUE
d <- data.frame(y = rep(0:1, 3), g = g)
b <- rbin_factor(d, y, g)
verify("A2-H03", counts(b), cbind(c(2, 1, 2, 1), c(1, 0, 1, 1), c(1, 1, 1, 0)))
verify("A2-H03 WoE a / total entropy", c(b$bins$woe[1], sum(b$bins$prop_entropy)), c(0, 2/3))

d <- data.frame(y = c(0, 1, 0, 0, 0, 1), g = c(1, 1, rep(1 + 1e-15, 3), 2))
verify("A2-H04", counts(rbin_factor(d, y, g)), cbind(c(2, 3, 1), c(1, 0, 1), c(1, 3, 0)))
d$g <- c(1, 1, 1 + 1e-15, 1 + 1e-15, 2, 2)
verify("A2-H04 equal-sized variant", counts(rbin_factor(d, y, g)), matrix(c(2, 2, 2, 1, 0, 1, 1, 2, 1), 3))

d <- data.frame(y = c(0, 0, 1, 0, 1, 1), x = c(-1, -1, -.5, .5, 1, 1) * 1e308)
for (f in list(rbin_equal_length, rbin_winsorize)) {
  b <- f(d, y, x, 3)
  verify("A2-H05 counts", b$bins$bin_count, c(3, 0, 3))
  verify("A2-H05 IV / entropy", c(sum(b$bins$iv), sum(b$bins$prop_entropy)), c(2 * log(2)/3, 0.9182958340544896))
}
for (n in c(11, 16)) {
  d <- data.frame(y = rep(0:1, length.out = n), x = seq_len(n))
  b <- rbin_quantiles(d, y, x, 5)
  verify(paste("A2-H06", n), b$bins$bin_count, c(rep((n - 1)/5, 4), (n - 1)/5 + 1))
  if (n == 11) verify("A2-H06 cuts / IV / entropy", c(b$upper_cut[1:4], sum(b$bins$iv), sum(b$bins$prop_entropy)), c(3, 5, 7, 9, 0.0924196240746594, (8 + 3 * (log2(3) - 2/3))/11))
}

d <- data.frame(g = factor(c("a", NA, "b"), exclude = NULL))
z <- rbin_factor_combine(d, g, "a", "A")$g
verify("A2-M01 codes / levels", list(as.integer(z), levels(z)), list(c(1L, 3L, 2L), c("A", "b", NA)))
d <- data.frame(g = ordered(c("low", "mid", "high"), levels = c("low", "mid", "high")))
verify("A2-M01 ordered", class(rbin_factor_combine(d, g, "low", "L")$g), c("ordered", "factor"))
for (g in list(factor(), character(), factor(c(NA, NA)), c(NA_character_, NA_character_))) {
  d <- data.frame(g = g)
  verify("A2-M02 / Hydrogen M1", rbin_factor_create(d, g), d)
}

if (requireNamespace("shiny", quietly = TRUE)) {
  d <- data.frame(y = rep(0:1, 2), x = 1:4)
  for (f in list(rbinAddin, rbinFactorAddin)) {
    gadget <- testthat::with_mocked_bindings(f(d),
      get_addin_context = function() list(selection = list(list(text = ""))),
      launch_gadget = function(ui, server) list(ui = ui, server = server), .package = "rbin")
    shiny::testServer(gadget$server, {
      session$setInputs(mydata = "nonexistent_new_data")
      verify("A2-M03", error_text(data1()), "Data 'nonexistent_new_data' not found.")
    })
  }
}
for (value in c("no", "yes")) {
  d <- data.frame(y = factor(rep(value, 4), levels = c("no", "yes")), x = 1:4, g = c("a", "a", "b", "b"))
  for (f in list(function() rbin_manual(d, y, x, 2.5), function() rbin_equal_length(d, y, x, 2),
                 function() rbin_quantiles(d, y, x, 2), function() rbin_winsorize(d, y, x, 2),
                 function() rbin_equal_freq(d, y, x, 2), function() rbin_factor(d, y, g))) {
    verify(paste("A2-M04", value), counts(f()), cbind(c(2, 2), rep(if (value == "yes") 2 else 0, 2), rep(if (value == "no") 2 else 0, 2)))
  }
}
verify("A2-M05", grepl("testthat (>= 3.1.7)", read.dcf("DESCRIPTION")[1, "Suggests"], fixed = TRUE), TRUE)
verify("A2-M05 callable API", is.function(getExportedValue("testthat", "with_mocked_bindings")), TRUE)
b <- rbin_equal_freq(mbank, y, age, 10)
verify("A2-M06 first/last counts", b$bins$bin_count[c(1, 10)], c(521, 389))
verify("A2-M06 first row bad/rate/WoE/IV", unlist(b$bins[1, c("bad", "good_rate", "woe", "iv")]), c(436, 85/521, -0.412015279067964, 0.022874655321817))

d <- data.frame(y = rep(0:1, 2), x = c(1, 2, 9, 10))
z <- rbin_create(data.frame(x = c(2, 3, 8, 9)), x, rbin_equal_freq(d, y, x, 2))
verify("A2-L01 names / cells", list(names(z), unname(as.matrix(z[-1]))), list(c("x", "x_<_9", "x_>=_9"), cbind(c(1L, 1L, 1L, 0L), c(0L, 0L, 0L, 1L))))
d <- data.frame(y = rep(0:1, 2), x = c(35, 36, 36.5, 40))
verify("A2-L02 open continuous bound", rbin_manual(d, y, x, 37)$bins$bin_count, c(3, 1))

d <- data.frame(y = c(0, 0, 1, 1), g = c(1e10, 1e10, 1e10 + 1e-5, 1e10 + 1e-5))
verify("Hydrogen H1", counts(rbin_factor(d, y, g)), cbind(c(2, 2), c(0, 2), c(2, 0)))
d <- data.frame(y = c(0, 1, 0, 1), g = c(1, 1, NaN, NaN))
verify("Hydrogen H2 case 1", counts(rbin_factor(d, y, g)), matrix(c(2, 2, 1, 1, 1, 1), 2))
d <- data.frame(y = c(0, 1, 0, 0, 1, 1), g = c(1, 1, NaN, NaN, NA, NA))
verify("Hydrogen H2 case 2", counts(rbin_factor(d, y, g)), cbind(c(2, 4), c(1, 2), c(1, 2)))
d <- data.frame(y = c(0, 1, 0, 1), g = factor(c("a", "b", NA), exclude = NULL)[1:4])
verify("Hydrogen H3", counts(rbin_factor(d, y, g)), cbind(rep(1, 4), c(0, 1, 0, 1), c(1, 0, 1, 0)))
d <- data.frame(g = factor(c("a", "b", NA)))
verify("Hydrogen H4 NA alone", as.character(rbin_factor_combine(d, g, NA, "missing")$g), c("a", "b", "missing"))
verify("Hydrogen H4 mixed selection", as.character(rbin_factor_combine(d, g, c("a", NA), "other")$g), c("other", "b", "other"))
d <- data.frame(g = factor(c("a", "b", NA), exclude = NULL))
z <- rbin_factor_combine(d, g, "a", "x")$g
verify("Hydrogen H5", list(levels(z), is.na(z)), list(c("x", "b", NA), c(FALSE, FALSE, FALSE)))
d <- data.frame(y = c(0, 1, 0, 1), g = factor(c("a", "a", "b", "b")))
rv <- "y"; pv <- "g"
verify("Hydrogen M2 strings", rbin_factor(d, "y", "g"), rbin_factor(d, y, g))
verify("Hydrogen M2 indirect", rbin_factor(d, rv, pv), rbin_factor(d, y, g))
d <- data.frame(y = factor(c("no", "yes", NA), exclude = NULL), g = factor(c("a", "b", "a")))
warnings <- character()
b <- withCallingHandlers(rbin_factor(d, y, g), warning = function(w) {
  warnings <<- c(warnings, conditionMessage(w)); invokeRestart("muffleWarning")
})
verify("Hydrogen M3 case 1 warning", warnings, "Dropping 1 row with missing response.")
verify("Hydrogen M3 case 1 counts", counts(b), cbind(c(1, 1), c(0, 1), c(1, 0)))
d <- data.frame(y = factor(c("no", NA), exclude = NULL), g = factor(c("a", "b")))
verify("Hydrogen M3 case 2", error_text(rbin_factor(d, y, g)), "response must be binary; the factor has 1 level(s) present")
d <- data.frame(y = rep(0:1, 3), g = factor(c("a", "a", "b", "b", NA, NA), exclude = NULL))
b <- rbin_factor(d, y, g)
verify("Hydrogen M4", list(levels(b$bins$level), is.na(b$bins$level), rbin_factor(d, y, g, FALSE)$bins$bin_count), list(c("a", "b", NA), rep(FALSE, 3), c(2, 2, 2)))
d$g <- ordered(c("low", "low", "med", "med", "high", "high"), levels = c("low", "med", "high"))
verify("Hydrogen M5", c(is.ordered(rbin_factor_combine(d, g, c("low", "med"), "low_med")$g), is.ordered(rbin_factor(d, y, g)$bins$level)), c(TRUE, TRUE))
d$g <- factor(c("a", "a", "b", "b", NA, NA))
p <- plot(rbin_factor(d, y, g), print_plot = FALSE)
verify("Hydrogen M6", ggplot2::ggplot_build(p)$layout$panel_params[[1]]$x$get_labels(), c("a", "b", "NA"))
combine_doc <- paste(readLines("man/rbin_factor_combine.Rd"), collapse = " ")
factor_doc <- paste(readLines("man/rbin_factor.Rd"), collapse = " ")
verify("Hydrogen L1", grepl("Bare or character name of a factor or character column", combine_doc, fixed = TRUE), TRUE)
verify("Hydrogen L2", vapply(c("first appearance", "POSIXct", "holding character names"), function(s) grepl(s, factor_doc, fixed = TRUE), logical(1)), rep(TRUE, 3))
cat("\nAll audit reproducer checks passed.\n")
