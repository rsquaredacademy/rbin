test_that("fx6 opus M1: character event coding is independent of collation", {
  original <- Sys.getlocale("LC_COLLATE")
  on.exit(Sys.setlocale("LC_COLLATE", original), add = TRUE)
  d <- data.frame(y = c("no", "Yes", "no", "no", "Yes", "no"),
                   x = c(1, 1, 1, 5, 5, 5))
  fitters <- list(
    function(d) rbin_manual(d, y, x, 3),
    function(d) rbin_quantiles(d, y, x, 2),
    function(d) rbin_equal_freq(d, y, x, 2),
    function(d) rbin_equal_length(d, y, x, 2),
    function(d) rbin_winsorize(d, y, x, 2),
    function(d) rbin_factor(d, y, x))
  for (locale in unique(c("C", original, "English_United States.utf8", "en_US.UTF-8"))) {
    active <- suppressWarnings(Sys.setlocale("LC_COLLATE", locale))
    if (!nzchar(active)) next
    for (fit in fitters) {
      b <- fit(d)
      fx2_expect_summary(b, c(1L, 0L, 1L, 1L, 0L, 1L), rep(1:2, each = 3), 2)
      f <- d
      f$y <- factor(f$y, levels = c("no", "Yes"))
      expect_equal(fit(f)$bins$good, c(1L, 1L))
    }
  }
})
