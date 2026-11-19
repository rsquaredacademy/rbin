# Actual-value witnesses, run only against disposable package copies.
# Usage: Rscript fx6-probes.R <package-directory>
args <- commandArgs(TRUE)
pkgload::load_all(args[1], quiet = TRUE)
show <- function(label, expr) {
  cat("\n", label, "\n", sep = "")
  tryCatch(print(force(expr)), error = function(e) cat("ERROR:", conditionMessage(e), "\n"))
}
d <- data.frame(x = c(0, 27, 29, 30, 58), y = c(0, 0, 1, 0, 1))
for (method in c("rbin_equal_length", "rbin_winsorize")) {
  b <- if (method == "rbin_equal_length") rbin_equal_length(d, y, x, 14) else rbin_winsorize(d, y, x, 14, winsor_rate = 0)
  show(paste(method, "cut 7"), sprintf("%.17g", b$upper_cut[7]))
  show("bins 7:8", b$bins[7:8, c("bin_count", "good", "bad", "woe", "iv", "entropy")])
  show("dummy bin for x=29", which(unlist(rbin_create(d, x, b)[3, -(1:2)]) == 1L))
}
show("mbank previous bins 29:30", rbin_equal_length(mbank, y, previous, 58)$bins$bin_count[29:30])
d <- data.frame(y = rep(0:1, 4), x = 1:8)
b <- rbin_manual(d, y, x, 5)
d$x <- bit64::as.integer64(d$x)
for (method in c("rbin_manual", "rbin_quantiles", "rbin_equal_freq", "rbin_equal_length", "rbin_winsorize", "rbin_factor")) {
  show(paste(method, "actual bit64::integer64"), {
    f <- switch(method, rbin_manual = rbin_manual(d, y, x, 5),
      rbin_quantiles = rbin_quantiles(d, y, x, 2), rbin_equal_freq = rbin_equal_freq(d, y, x, 2),
      rbin_equal_length = rbin_equal_length(d, y, x, 2), rbin_winsorize = rbin_winsorize(d, y, x, 2),
      rbin_factor = rbin_factor(d, y, x))
    if (method == "rbin_factor") f$bins$bin_count else
      list(count = f$bins$bin_count, dummy = colSums(rbin_create(d, x, f)[-(1:2)]))
  })
}
show("rbin_create scores actual integer64 against a plain fit", rbin_create(d, x, b))
g <- structure(c(1L, 2L, 2L, NA_integer_), levels = c("NA", NA), class = "factor")
d <- data.frame(y = c(0, 1, 1, 0), g = g)
z <- testthat::with_mocked_bindings(rbinFactorAddin(d),
  launch_gadget = function(ui, server) list(ui = ui, server = server), .package = "rbin")
s <- shiny::MockShinySession$new()
options <- NULL
s$sendInputMessage <- function(inputId, message) if (inputId == "sel_cat") options <<- as.character(message$options)
shiny::testServer(z$server, session = s, {
  session$setInputs(mydata = "d", resp_var = "y", pred_var = "g", select_vars = 1)
  show("factor addin HTML options", options)
  ids <- sub('^value="(.*)"$', '\\1', regmatches(options, gregexpr('value="[^"]*"', options))[[1]])
  session$setInputs(sel_cat = ids[2], new_lev = "Merged", create_bins = 1)
  show("factor addin selecting the explicit NA option", woe_man()$bins[, 1:4])
})
d <- data.frame(y = c("no", "Yes", "no", "no", "Yes", "no"), x = c(1, 1, 1, 5, 5, 5))
for (locale in c("C", "English_United States.utf8")) {
  if (nzchar(suppressWarnings(Sys.setlocale("LC_COLLATE", locale))))
    show(paste("character response", locale), rbin_manual(d, y, x, 3)$bins[c("good", "bad", "woe")])
}
Sys.setlocale("LC_COLLATE", "C")
d <- data.frame(y = 0:1, x = 1:4)
for (rate in list(.6, NA_real_, -.1)) {
  show(paste("winsor_rate", rate), rbin_winsorize(d, y, x, 2, winsor_rate = rate)$clamp)
}
show("winsor_rate .6 with min_val", rbin_winsorize(d, y, x, 2, winsor_rate = .6, min_val = 1)$clamp)
d$x[1] <- NA
show("remove_na FALSE with missing predictor", rbin_winsorize(d, y, x, 2, remove_na = FALSE))
d <- data.frame(y = 0:1, x = 1:4)
show("wrong bins: factor fit", ncol(rbin_create(d, x, rbin_factor(d, y, x))))
show("wrong bins: list", ncol(rbin_create(d, x, list(1, 2))))
d <- data.frame(x = c(rep(1, 6), 2:3), y = rep(0:1, 4))
show("heavy ties: correct summary and dummies", {
  b <- rbin_equal_freq(d, y, x, 4)
  list(count = b$bins$bin_count, dummy = colSums(rbin_create(d, x, b)[-(1:2)]))
})
