test_that("A2-M03: both addins validate a changed unresolved data name", {
  skip_if_not_installed("shiny")
  skip_if_not_installed("miniUI")
  skip_if_not_installed("rstudioapi")
  run <- function() {
  name <- "fx2_replacement"
  had_old <- exists(name, envir = globalenv(), inherits = FALSE)
  if (had_old) old <- get(name, envir = globalenv())
  on.exit(if (had_old) assign(name, old, envir = globalenv()) else
    rm(list = name, envir = globalenv()), add = TRUE)
  d <- data.frame(y = rep(0:1, 2), x = 1:4)
  for (addin in list(rbinAddin, rbinFactorAddin)) {
    gadget <- testthat::with_mocked_bindings(
      addin(d),
      get_addin_context = function() list(selection = list(list(text = ""))),
      launch_gadget = function(ui, server) list(ui = ui, server = server),
      .package = "rbin")
    replacement <- data.frame(y = 0:1, x = 100:101)
    assign(name, replacement, envir = globalenv())
      shiny::testServer(gadget$server, {
        session$setInputs(mydata = "d")
        expect_identical(data1(), d)
        for (bad in c("nonexistent_new_data", "another_nonexistent_data")) {
          session$setInputs(mydata = bad)
          expect_error(data1(), paste0("Data '", bad, "' not found"), class = "shiny.silent.error")
        }
        session$setInputs(mydata = "fx2_replacement")
        expect_identical(data1(), replacement)
        session$setInputs(mydata = "")
        expect_identical(data1(), d)
      })
  }
  }
  run()
})
