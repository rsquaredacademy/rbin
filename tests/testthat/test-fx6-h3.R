test_that("fx6 H3: factor addin decodes distinct literal and explicit NA IDs", {
  skip_if_not_installed("shiny")
  skip_if_not_installed("miniUI")
  skip_if_not_installed("rstudioapi")
  g <- structure(c(1L, 2L, 2L, NA_integer_),
                 levels = c("NA", NA), class = "factor")
  d <- data.frame(y = c(0, 1, 1, 0), g = g)
  gadget <- testthat::with_mocked_bindings(
    rbinFactorAddin(d),
    launch_gadget = function(ui, server) list(ui = ui, server = server),
    .package = "rbin")
  s <- shiny::MockShinySession$new()
  options <- NULL
  s$sendInputMessage <- function(inputId, message) {
    if (inputId == "sel_cat") options <<- as.character(message$options)
  }
  shiny::testServer(gadget$server, session = s, {
    session$setInputs(mydata = "d", resp_var = "y", pred_var = "g", select_vars = 1)
    hits <- regmatches(options, gregexpr('value="[^"]*"', options))[[1]]
    ids <- sub('^value="(.*)"$', '\\1', hits)
    expect_length(ids, 2)
    expect_length(unique(ids), 2)
    session$setInputs(sel_cat = ids[2], new_lev = "Merged", create_bins = 1)
    b <- woe_man()
    expect_equal(as.character(b$bins$level), c("NA", "Merged"))
    expect_equal(b$bins[c("bin_count", "good", "bad")],
                 data.frame(bin_count = c(1L, 3L), good = c(0L, 2L), bad = c(1L, 1L)))
    session$setInputs(sel_cat = ids[1], create_bins = 2)
    b <- woe_man()
    expect_equal(as.character(b$bins$level), c("Merged", NA, NA))
    expect_equal(b$bins$bin_count, c(1L, 2L, 1L))
  })
})
