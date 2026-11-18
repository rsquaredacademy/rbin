# Reproducer for #79: one-column matrix predictor with column names.
suppressPackageStartupMessages(devtools::load_all(".", quiet = TRUE))

d <- as.data.frame(mbank)
d$age_z <- scale(mbank["age"])

cat("class(d$age_z):", paste(class(d$age_z), collapse = "/"), "\n")
cat("dim(d$age_z):", paste(dim(d$age_z), collapse = " x "), "\n\n")

snippet <- function(label, expr) {
  cat("--- ", label, " ---\n", sep = "")
  out <- tryCatch(expr, error = function(e) e)
  if (inherits(out, "error")) {
    cat("ERROR:", conditionMessage(out), "\n\n")
  } else {
    cat("OK: class", paste(class(out), collapse = "/"), "\n")
    if (!is.null(out$bins)) {
      cat("bins rows:", nrow(out$bins), " columns:", ncol(out$bins), "\n")
    } else {
      cat("columns:", ncol(out), "\n")
    }
    cat("\n")
  }
  invisible(out)
}

q <- snippet("rbin_quantiles(d, y, age_z, 5)",
             rbin_quantiles(d, y, age_z, 5))
snippet("rbin_factor(d, y, age_z)",
        rbin_factor(d, y, age_z))

k <- rbin_quantiles(d, y, age, 5)
snippet("rbin_create(d, age_z, k)",
        rbin_create(d, age_z, k))
