test_that("fx7: selections belong to the displayed predictor and data", {
  skip_if_not_installed("shiny")
  skip_if_not_installed("miniUI")
  skip_if_not_installed("rstudioapi")
  d <- as.data.frame(mbank)[c("y", "education", "marital")]
  assign(".rbin_fx7_other", transform(d, marital = rev(marital)), envir = .GlobalEnv)
  on.exit(rm(".rbin_fx7_other", envir = .GlobalEnv), add = TRUE)
  gadget <- testthat::with_mocked_bindings(
    rbinFactorAddin(d),
    launch_gadget = function(ui, server) list(ui = ui, server = server),
    .package = "rbin")
  session_mock <- shiny::MockShinySession$new()
  updates <- list()
  session_mock$sendInputMessage <- function(inputId, message) {
    if (inputId == "sel_cat") updates[[length(updates) + 1L]] <<- message
  }
  shiny::testServer(gadget$server, session = session_mock, {
    session$setInputs(mydata = "d", resp_var = "y", pred_var = "education", select_vars = 1)
    session$setInputs(sel_cat = c("level_1", "level_2"), new_lev = "Merged", create_bins = 1)
    expect_true("Merged" %in% as.character(woe_man()$bins$level))
    session$setInputs(pred_var = "marital")
    expect_length(tail(updates, 1)[[1]]$value, 0)
    session$setInputs(create_bins = 2)
    expect_error(woe_man(), "Select categories again", class = "shiny.silent.error")
    session$setInputs(select_vars = 2, sel_cat = "level_1", create_bins = 3)
    expect_true("Merged" %in% as.character(woe_man()$bins$level))
    session$setInputs(mydata = ".rbin_fx7_other")
    expect_length(tail(updates, 1)[[1]]$value, 0)
    session$setInputs(create_bins = 4)
    expect_error(woe_man(), "Select categories again", class = "shiny.silent.error")
    session$setInputs(select_vars = 3, sel_cat = "level_1", create_bins = 5)
    expect_true("Merged" %in% as.character(woe_man()$bins$level))
    changed <- get(".rbin_fx7_other", envir = .GlobalEnv)
    changed$marital <- rev(changed$marital)
    assign(".rbin_fx7_other", changed, envir = .GlobalEnv)
    session$setInputs(create_bins = 6)
    expect_error(woe_man(), "Select categories again", class = "shiny.silent.error")
    session$setInputs(mydata = ".rbin_fx7_missing", create_bins = 7)
    expect_error(woe_man(), "Select categories again", class = "shiny.silent.error")
  })
})

test_that("fx7: numeric methods give appropriate class diagnostics", {
  d <- data.frame(y = rep(0:1, 4), x = 1:8)
  fitters <- list(function() rbin_manual(d, y, x, 4),
                  function() rbin_quantiles(d, y, x, 2),
                  function() rbin_equal_freq(d, y, x, 2),
                  function() rbin_equal_length(d, y, x, 2),
                  function() rbin_winsorize(d, y, x, 2))
  for (x in list(factor(1:8), ordered(1:8), as.Date("2020-01-01") + 1:8,
                 as.POSIXct("2020-01-01", tz = "UTC") + 1:8)) {
    d$x <- x
    for (fit in fitters) expect_error(fit(), "predictor must be a numeric variable for this binning method; use rbin_factor\\(\\) for categorical predictors")
  }
})

test_that("fx7: AsIs and difftime predictors retain supported behavior", {
  d <- data.frame(y = rep(0:1, 4), x = 1:8)
  fitters <- list(function() rbin_manual(d, y, x, 4),
                  function() rbin_quantiles(d, y, x, 2),
                  function() rbin_equal_freq(d, y, x, 2),
                  function() rbin_equal_length(d, y, x, 2),
                  function() rbin_winsorize(d, y, x, 2))
  reference <- lapply(fitters, function(f) f()$bins$bin_count)
  for (x in list(I(as.double(1:8)), as.difftime(1:8, units = "days"))) {
    d$x <- x
    for (i in seq_along(fitters)) expect_equal(fitters[[i]]()$bins$bin_count, reference[[i]])
    expect_equal(rbin_factor(d, y, x)$bins$bin_count, rep(1L, 8))
    fit <- rbin_manual(d, y, x, 4)
    expect_equal(unname(colSums(rbin_create(d, x, fit)[-(1:2)])), c(3, 5))
  }
  d$x <- structure(as.double(1:8), class = "integer64")
  expect_error(rbin_factor(d, y, x), "integer64.*as.numeric")
})

test_that("fx7: response documentation describes byte ordering", {
  root <- testthat::test_path("..", "..")
  files <- file.path(root, c("NEWS.md", file.path("R", c("rbin-manual.R", "rbin-quantile.R", "rbin-equal-length.R", "rbin-equal-freq.R", "rbin-winsorize.R", "rbin-factor.R"))))
  if (!all(file.exists(files))) skip("source documentation is unavailable")
  for (file in files) {
    text <- paste(readLines(file, warn = FALSE), collapse = " ")
    expect_match(text, "byte \\(C-locale\\) order")
    expect_match(text, "ASCII before accented characters")
  }
})
