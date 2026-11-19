# Regression tests for #79 (one-column matrix predictors) and #80 (scalar
# argument validation).

test_that("#79: one-column matrix predictors give the same bins as vectors", {
  d <- as.data.frame(mbank)
  d$age_z     <- scale(mbank["age"])
  d$age_z_vec <- as.vector(scale(mbank$age))

  expect_true(is.matrix(d$age_z))
  expect_equal(dim(d$age_z), c(nrow(d), 1L))

  methods <- c("manual", "equal_length", "quantiles", "winsorize",
               "equal_freq")

  for (method in methods) {
    args_z <- list(data = d, response = "y", predictor = "age_z")
    args_v <- list(data = d, response = "y", predictor = "age_z_vec")

    if (identical(method, "manual")) {
      args_z$cut_points <- c(-1, 0, 1)
      args_v$cut_points <- c(-1, 0, 1)
    } else {
      args_z$bins <- 5
      args_v$bins <- 5
    }

    fit_z <- do.call(get(paste0("rbin_", method)), args_z)
    fit_v <- do.call(get(paste0("rbin_", method)), args_v)

    expect_equal(fit_z$bins, fit_v$bins, info = method)
  }

  expect_equal(rbin_factor(d, y, age_z)$bins,
               rbin_factor(d, y, age_z_vec)$bins)
})

test_that("#79: rbin_create scores a one-column matrix predictor like the vector", {
  d <- as.data.frame(mbank)
  d$pred_matrix <- scale(mbank["age"])
  d$pred_vector <- as.vector(scale(mbank$age))

  expect_true(is.matrix(d$pred_matrix))
  expect_equal(dim(d$pred_matrix), c(nrow(d), 1L))

  # Fit on the vector and on the one-column matrix (#79): the fitted bins must
  # be identical before scoring is compared.
  k <- rbin_quantiles(d, y, pred_vector, 5)
  expect_equal(rbin_quantiles(d, y, pred_matrix, 5)$bins, k$bins)

  # Score the same values from a matrix column and a vector column. Both data
  # sets use the same predictor column name so the dummy columns line up.
  data_matrix <- d
  data_matrix$pred <- d$pred_matrix
  data_vector <- d
  data_vector$pred <- d$pred_vector

  out_matrix <- rbin_create(data_matrix, pred, k)
  out_vector <- rbin_create(data_vector, pred, k)

  dummy_cols <- setdiff(names(out_matrix), names(data_matrix))
  expect_length(dummy_cols, 5L)
  expect_equal(out_matrix[dummy_cols], out_vector[dummy_cols])
  expect_equal(as.matrix(out_matrix[dummy_cols]),
               as.matrix(out_vector[dummy_cols]))
})

test_that("#79: a multi-column matrix predictor errors and names the predictor", {
  d <- as.data.frame(mbank)
  d$two_cols <- cbind(first = seq_len(nrow(d)), second = seq_len(nrow(d)))

  expect_error(rbin_quantiles(d, y, two_cols, 5),
               "predictor 'two_cols' is a matrix with 2 columns")
  expect_error(rbin_equal_length(d, y, two_cols, 5),
               "predictor 'two_cols' is a matrix with 2 columns")
  expect_error(rbin_winsorize(d, y, two_cols, 5),
               "predictor 'two_cols' is a matrix with 2 columns")
  expect_error(rbin_equal_freq(d, y, two_cols, 5),
               "predictor 'two_cols' is a matrix with 2 columns")
  expect_error(rbin_manual(d, y, two_cols, c(-1, 0, 1)),
               "predictor 'two_cols' is a matrix with 2 columns")
  expect_error(rbin_factor(d, y, two_cols),
               "predictor 'two_cols' is a matrix with 2 columns")

  k <- rbin_quantiles(d, y, age, 5)
  expect_error(rbin_create(d, two_cols, k),
               "predictor 'two_cols' is a matrix with 2 columns")
})

test_that("#80: include_na must be a single TRUE or FALSE", {
  d <- data.frame(y = rep(0:1, 4), x = 1:8,
                  g = factor(rep(c("a", "b"), 4)))

  invalid <- list(NA, c(TRUE, FALSE), 1, 0, "TRUE", logical())

  for (value in invalid) {
    expect_error(rbin_manual(d, y, x, 4, include_na = value),
                 "`include_na` must be a single TRUE or FALSE")
    expect_error(rbin_equal_length(d, y, x, 2, include_na = value),
                 "`include_na` must be a single TRUE or FALSE")
    expect_error(rbin_quantiles(d, y, x, 2, include_na = value),
                 "`include_na` must be a single TRUE or FALSE")
    expect_error(rbin_winsorize(d, y, x, 2, include_na = value),
                 "`include_na` must be a single TRUE or FALSE")
    expect_error(rbin_factor(d, y, g, include_na = value),
                 "`include_na` must be a single TRUE or FALSE")
  }

  expect_error(rbin_quantiles(d, y, x, 2, include_na = TRUE), NA)
  expect_error(rbin_factor(d, y, g, include_na = FALSE), NA)
})

test_that("#80: min_val and max_val are single finite numbers or NULL", {
  d <- data.frame(y = rep(0:1, 4), x = 1:8)

  invalid <- list(NA_real_, NaN, Inf, -Inf, c(1, 2), numeric(), "1", TRUE)

  for (value in invalid) {
    expect_error(rbin_winsorize(d, y, x, 2, min_val = value),
                 "`min_val` must be a single finite number or NULL")
    expect_error(rbin_winsorize(d, y, x, 2, max_val = value),
                 "`max_val` must be a single finite number or NULL")
  }

  expect_error(rbin_winsorize(d, y, x, 2, min_val = NULL, max_val = NULL), NA)
  expect_error(rbin_winsorize(d, y, x, 2, min_val = 1, max_val = 8), NA)
})
