# Regression tests for the 0.2.2 pre-CRAN audit (RStudio addin findings).
#
# Only the desktop lookups are mocked: the real exported addins, UI and server
# callbacks are exercised through shiny::testServer().

capture_gadget <- function(expr) {
  testthat::with_mocked_bindings(
    code = expr,
    get_addin_context = function() {
      list(selection = list(list(text = "")))
    },
    launch_gadget = function(ui, server) {
      list(ui = ui, server = server)
    },
    .package = "rbin"
  )
}

skip_addin <- function() {
  skip_if_not_installed("shiny")
  skip_if_not_installed("miniUI")
  skip_if_not_installed("rstudioapi")
}

test_that("H13: numeric addin drops missing responses like the core methods", {
  skip_addin()

  dd <- data.frame(y = c(0, 1, 0, 1, NA), x = 1:5)
  gadget <- capture_gadget(rbinAddin(dd))

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x",
                      n_bins = 2)
    session$setInputs(`n_bins_ 1` = 3)

    warnings <- testthat::capture_warnings(
      session$setInputs(create_bins = 1)
    )
    expect_true(any(grepl("Dropping 1 row", warnings)))
    b <- compute_bins()

    expect_equal(b$bins$bin_count, c(2L, 2L))
    expect_equal(b$bins$good, c(1L, 1L))
    expect_equal(b$bins$bad, c(1L, 1L))
    expect_equal(b$bins$woe, c(0, 0))
    expect_equal(b$bins$iv, c(0, 0))
  })

  reference <- rbin_manual(dd[!is.na(dd$y), ], y, x, 3)

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x",
                      n_bins = 2)
    session$setInputs(`n_bins_ 1` = 3)
    suppressWarnings(session$setInputs(create_bins = 1))
    b <- compute_bins()
    expect_equal(b$bins, reference$bins)
  })
})

test_that("H13: factor addin drops missing responses like the core methods", {
  skip_addin()

  dd <- data.frame(y = c(0, 1, 0, 1, NA),
                   g = factor(c("a", "a", "b", "b", "b")))
  gadget <- capture_gadget(rbinFactorAddin(dd))

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "dd", resp_var = "y", pred_var = "g",
                      sel_cat = "a", new_lev = "a")
    warnings <- testthat::capture_warnings(
      session$setInputs(create_bins = 1)
    )
    expect_true(any(grepl("Dropping 1 row", warnings)))
    b <- woe_man()

    expect_equal(b$bins$bin_count, c(2L, 2L))
    expect_equal(b$bins$good, c(1L, 1L))
    expect_equal(b$bins$bad, c(1L, 1L))
    expect_equal(b$bins$woe, c(0, 0))
    expect_equal(b$bins$iv, c(0, 0))
  })
})

test_that("H14: both addins accept data.table input", {
  skip_addin()

  dd <- data.table::data.table(y = rep(0:1, 2), x = 1:4)
  gadget <- capture_gadget(rbinAddin(dd))

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x",
                      n_bins = 2)
    session$setInputs(`n_bins_ 1` = 3)
    session$setInputs(create_bins = 1)

    b <- compute_bins()
    expect_equal(b$bins$bin_count, c(2L, 2L))
    expect_equal(b$bins$good, c(1L, 1L))
    expect_equal(b$bins$bad, c(1L, 1L))
    expect_equal(b$bins$woe, c(0, 0))
    expect_equal(b$bins$iv, c(0, 0))
  })

  df <- as.data.frame(dd)
  reference <- rbin_manual(df, y, x, 3)

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "dd", resp_var = "y", pred_var = "x",
                      n_bins = 2)
    session$setInputs(`n_bins_ 1` = 3)
    session$setInputs(create_bins = 1)
    expect_equal(compute_bins()$bins, reference$bins)
  })

  dd2 <- data.table::data.table(y = rep(0:1, 3),
                                g = factor(c("a", "a", "b", "b", "b", "b")))
  gadget2 <- capture_gadget(rbinFactorAddin(dd2))

  shiny::testServer(gadget2$server, {
    session$setInputs(mydata = "dd2", resp_var = "y", pred_var = "g",
                      sel_cat = "a", new_lev = "a")
    session$setInputs(create_bins = 1)

    b <- woe_man()
    expect_equal(b$bins$bin_count, c(2L, 4L))
    expect_false(anyNA(b$bins$good))
    expect_false(anyNA(b$bins$bad))
  })
})

test_that("H16: addins work with their default data argument", {
  skip_addin()

  gadget <- capture_gadget(rbinAddin(NULL))
  expect_true(is.list(gadget))
  expect_true(all(c("ui", "server") %in% names(gadget)))

  shiny::testServer(gadget$server, {
    expect_error(data1(), class = "shiny.silent.error")
  })

  gadget2 <- capture_gadget(rbinFactorAddin(NULL))
  expect_true(is.list(gadget2))
  expect_true(all(c("ui", "server") %in% names(gadget2)))
})

test_that("H16: addins use a supplied data.frame directly", {
  skip_addin()

  gadget <- capture_gadget(rbinAddin(data = data.frame(y = 0:1, x = 1:2)))

  shiny::testServer(gadget$server, {
    session$setInputs(mydata = "")
    expect_equal(names(data1()), c("y", "x"))

    session$setInputs(mydata = "data.frame(y = 0:1, x = 1:2)")
    expect_equal(names(data1()), c("y", "x"))
  })

  gadget2 <- capture_gadget(
    rbinFactorAddin(data = data.frame(y = 0:1, g = factor(c("a", "b"))))
  )

  shiny::testServer(gadget2$server, {
    session$setInputs(mydata = "")
    expect_equal(names(data1()), c("y", "g"))
  })
})
