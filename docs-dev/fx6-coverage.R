# Reconstructed fresh-pass comparisons from both audit descriptions.
# Usage: Rscript fx6-coverage.R <disposable-package-directory> <output-prefix>
# Expected assignments/statistics use base R only, never rbin internals.
args <- commandArgs(TRUE)
pkgload::load_all(args[1], quiet = TRUE)
data("mbank", package = "rbin")
results <- list()
same <- function(actual, expected, what) {
  comparison <- all.equal(actual, expected, tolerance = 2e-14,
                          check.attributes = FALSE)
  if (!isTRUE(comparison)) stop(what, ": ", paste(comparison, collapse = "; "))
}
record <- function(audit, case, method, k, work) {
  outcome <- tryCatch({ force(work); "OK" }, error = function(e) conditionMessage(e))
  results[[length(results) + 1L]] <<- data.frame(
    audit, case, method, k, status = if (outcome == "OK") "OK" else "FAIL",
    detail = outcome)
}
response_code <- function(y) {
  if (is.factor(y)) {
    lev <- levels(y)[!is.na(levels(y))]
    return(as.integer(as.character(y) == lev[2]))
  }
  if (is.character(y)) return(as.integer(y == sort(unique(y[!is.na(y)]), method = "radix")[2]))
  as.integer(y)
}
statistics <- function(y, group, K) {
  G <- tabulate(group[y == 1], K)
  B <- tabulate(group[y == 0], K)
  N <- G + B
  p <- N / sum(N)
  GD <- if (sum(G)) G / sum(G) else rep(NA_real_, K)
  BD <- if (sum(B)) B / sum(B) else rep(NA_real_, K)
  W <- log(BD / GD)
  E <- vapply(seq_len(K), function(j) {
    z <- c(G[j], B[j]); z <- z[z > 0] / N[j]
    -sum(z * log2(z))
  }, numeric(1))
  out <- data.frame(bin_count = N, good = G, bad = B,
    bin_cum_count = cumsum(N), good_cum_count = cumsum(G), bad_cum_count = cumsum(B),
    bin_prop = p, good_rate = G/N, bad_rate = B/N, good_dist = GD, bad_dist = BD,
    woe = W, dist_diff = BD-GD, iv = (BD-GD)*W, entropy = E, prop_entropy = p*E)
  empty <- N == 0
  out[empty, c("good_rate", "bad_rate", "woe")] <- NA_real_
  out[empty, c("good_dist", "bad_dist", "dist_diff", "iv")] <- 0
  out
}
summary_check <- function(b, y, group, K) {
  ref <- statistics(y, group, K)
  # Discrete checks must be exact, independently of the floating tolerance.
  for (field in names(ref)) {
    if (field %in% c("bin_count", "good", "bad", "bin_cum_count", "good_cum_count", "bad_cum_count")) {
      if (!identical(as.integer(b$bins[[field]]), as.integer(ref[[field]]))) stop(field, " membership/count mismatch")
    } else same(b$bins[[field]], ref[[field]], field)
  }
  same(sum(b$bins$prop_entropy), sum(ref$prop_entropy), "total entropy")
}
fitters <- list(manual = rbin_manual, quantile = rbin_quantiles,
                equal_freq = rbin_equal_freq, equal_length = rbin_equal_length,
                winsorize = rbin_winsorize)
numeric_check <- function(d, method, k = 5, include = TRUE, cuts = NULL,
                          rate = .05, new = NULL) {
  y <- response_code(d[[1]])
  keep <- !is.na(y)
  if (!include) keep <- keep & !is.na(d[[2]])
  x <- d[[2]][keep]; y <- y[keep]
  v <- x[!is.na(x)]
  clamp <- NULL
  if (method == "winsorize" && length(v)) {
    clamp <- quantile(v, c(rate, 1-rate), type = 7, names = FALSE)
    x <- pmin(pmax(x, clamp[1]), clamp[2]); v <- x[!is.na(x)]
  }
  if (method == "manual") {
    if (is.null(cuts)) cuts <- c(1, 3, 7)
  } else if (!length(v)) {
    if (method == "equal_freq") stop("oracle requires non-missing predictors")
    cuts <- numeric()
  } else if (method == "quantile") {
    cuts <- quantile(v, seq_len(k-1)/k, type = 7, names = FALSE)
  } else if (method == "equal_freq") {
    q <- unique(quantile(v, seq_len(k-1)/k, type = 1, names = FALSE))
    cuts <- vapply(q[q < max(v)], function(t) min(v[v > t]), numeric(1))
  } else {
    cuts <- min(v) + (as.double(max(v))-min(v)) * seq_len(k-1) / k
  }
  n <- if (!length(v) && method != "manual") 0L else length(cuts)+1L
  group <- if (n) 1L + findInterval(x, cuts) else rep(NA_integer_, length(x))
  missing <- anyNA(group)
  group[is.na(group)] <- n+1L
  arguments <- list(data = d, response = names(d)[1], predictor = names(d)[2])
  if (method == "manual") arguments$cut_points <- cuts else arguments$bins <- k
  if (method != "equal_freq") arguments$include_na <- include
  if (method == "winsorize") arguments$winsor_rate <- rate
  warnings <- messages <- character()
  b <- withCallingHandlers(do.call(fitters[[method]], arguments),
    warning = function(w) { warnings <<- c(warnings, conditionMessage(w)); invokeRestart("muffleWarning") },
    message = function(m) { messages <<- c(messages, conditionMessage(m)); invokeRestart("muffleMessage") })
  same(length(warnings), as.integer(anyNA(response_code(d[[1]]))), "response warning count")
  if (length(warnings) && !grepl("Dropping", warnings[1])) stop("unexpected warning")
  same(length(messages), as.integer(method == "equal_freq" && n < k), "tie message count")
  summary_check(b, y, group, n+missing)
  same(b$bins$bin, c(seq_len(n), if (missing) NA_integer_), "numeric IDs")
  same(b$vars, names(d), "variable names")
  if (n) {
    lower <- if (method == "equal_freq") c(-Inf, cuts) else c(if (length(v)) min(c(v, cuts)) else -Inf, cuts)
    upper <- if (method == "equal_freq") c(cuts, Inf) else c(cuts, max(c(if (length(v)) max(v)+1 else 1, tail(cuts, 1))))
    same(b$lower_cut, lower, "lower bounds")
    same(b$upper_cut, upper, "upper bounds")
    if (method == "equal_freq") {
      same(b$bins$lower_cut, c(lower, if (missing) NA_real_), "table lower bounds")
      same(b$bins$upper_cut, c(upper, if (missing) NA_real_), "table upper bounds")
    } else {
      labelcuts <- c(cuts, tail(cuts, 1))
      labels <- c(paste("<", as.character(head(labelcuts, -1))), paste(">=", as.character(tail(labelcuts, 1))))
      same(b$bins$cut_point, c(labels, if (missing) "NA"), "interval labels")
    }
  } else {
    same(b$lower_cut, numeric(), "all-missing lower")
    same(b$upper_cut, numeric(), "all-missing upper")
  }
  if (!is.null(clamp)) same(unname(b$clamp), clamp, "fitted clamp")
  score <- if (is.null(new)) d else new
  sx <- score[[2]]
  if (!is.null(clamp)) sx <- pmin(pmax(sx, clamp[1]), clamp[2])
  sg <- if (n) 1L+findInterval(sx, cuts) else rep(NA_integer_, length(sx))
  indicators <- rbin_create(score, names(score)[2], b)[-(1:2)]
  expected <- outer(sg, seq_len(n), "==") * 1L
  if (n) same(unname(as.matrix(indicators)), expected, "dummy membership") else same(ncol(indicators), 0L, "all-missing dummies")
  if (n && !identical(as.integer(as.matrix(indicators)), as.integer(expected))) stop("exact dummy membership mismatch")
}
factor_check <- function(d, include = TRUE, combine = FALSE, selected = NULL) {
  original <- d
  if (combine) {
    g <- d[[2]]
    if (!is.factor(g)) g <- factor(g)
    if (is.null(selected)) selected <- levels(g)[1:2]
    lev <- levels(g); mapped <- lev; mapped[lev %in% selected] <- "Merged"
    newlev <- unique(mapped)
    code <- match(mapped, newlev)[as.integer(g)]
    if (anyNA(selected)) {
      if (!"Merged" %in% newlev) newlev <- c(newlev, "Merged")
      code[is.na(as.integer(g))] <- match("Merged", newlev)
    }
    expected <- structure(code, levels = newlev, class = class(g))
    d <- rbin_factor_combine(d, names(d)[2], selected, "Merged")
    same(d[[2]], expected, "combined factor")
    if (!identical(levels(d[[2]]), levels(expected)) || !identical(class(d[[2]]), class(expected))) stop("combined metadata")
  }
  y <- response_code(d[[1]]); keep <- !is.na(y)
  g <- d[[2]]; key <- if (is.factor(g)) as.integer(g) else g
  if (!include) keep <- keep & !is.na(key)
  key <- key[keep]; yy <- y[keep]
  key[is.na(key)] <- NA
  ids <- unique(key[!is.na(key)])
  if (is.factor(g)) {
    ni <- which(is.na(levels(g)))
    ids <- c(ids[!ids %in% ni], ids[ids %in% ni])
  }
  if (anyNA(key)) ids <- c(ids, NA)
  h <- match(key, ids)
  b <- suppressWarnings(rbin_factor(d, names(d)[1], names(d)[2], include_na = include))
  summary_check(b, yy, h, length(ids))
  labels <- g[keep][match(ids, key)]
  if (!is.factor(labels) && anyNA(key)) labels[length(labels)] <- NA
  same(b$bins$level, labels, "typed category labels")
  if (is.factor(g)) {
    if (!identical(levels(b$bins$level), levels(g)) || !identical(class(b$bins$level), class(g))) stop("factor metadata")
  }
  # The categorical dummy API accepts factor/character predictors.
  scoring <- d
  if (!is.factor(scoring[[2]])) scoring[[2]] <- factor(scoring[[2]])
  f <- scoring[[2]]
  expected <- outer(as.integer(f), seq_along(levels(f)), "==") * 1L
  actual <- rbin_factor_create(scoring, names(scoring)[2])[-(1:2)]
  same(unname(as.matrix(actual)), expected, "factor dummy membership")
  if (!identical(as.integer(as.matrix(actual)), as.integer(expected))) stop("exact factor dummy mismatch")
  invisible(original)
}
frame <- function(x, y = rep(0:1, length.out = length(x))) data.frame(y = y, x = x)
na_x <- frame(c(NA, NaN, 1:38))
na_y <- frame(1:40); na_y$y[1:2] <- c(NA, NaN)
pure <- frame(rep(1:4, each = 10), rep(c(0, 0, 1, 1), each = 10))
fy <- frame(1:40, factor(rep(c("stay", "churn"), 20), levels = c("stay", "churn")))
explicit <- fy
explicit$y <- factor(c(NA, rep(c("stay", "churn"), length.out = 39)),
                     levels = c("stay", "churn", NA), exclude = NULL)
is.na(explicit$y)[2] <- TRUE
long <- frame(1:40); names(long) <- c(paste(rep("response !", 20), collapse = " "), paste(rep("predictor ?", 20), collapse = " "))
opus_broad <- list(mbank_age = frame(mbank$age, mbank$y),
  mbank_balance = frame(mbank$balance, mbank$y), mbank_pdays_tied = frame(mbank$pdays, mbank$y),
  tied = frame(c(rep(0, 30), 1:10)), na_pred = na_x)
for (case in names(opus_broad)) for (method in names(fitters)) {
  ks <- if (method == "manual") 5 else if (method == "equal_freq") c(1, 2, 3, 5, 7, 10, 20) else c(2, 3, 5, 7, 10, 20)
  for (k in ks) record("opus", case, method, k, numeric_check(opus_broad[[case]], method, k))
}
for (method in setdiff(names(fitters), "equal_freq")) record("opus", "na_pred_excluded", method, 5, numeric_check(na_x, method, include = FALSE))
for (case in c("na_resp", "pure_bins", "factor_resp", "factor_resp_NAlevel", "long_names")) {
  d <- switch(case, na_resp = na_y, pure_bins = pure, factor_resp = fy, factor_resp_NAlevel = explicit, long_names = long)
  for (method in names(fitters)) record("opus", case, method, 5, numeric_check(d, method))
}
eg <- structure(rep(c(1L, 2L, 3L, NA_integer_), 10), levels = c("a", "NA", NA), class = "factor")
education <- mbank$education; is.na(education)[1:2] <- TRUE
factor_cases <- list(mbank_job = frame(mbank$job, mbank$y), education_na = frame(education, mbank$y),
  education_exclude = frame(education, mbank$y), explicit = frame(eg), explicit_exclude = frame(eg),
  character = frame(rep(c("a", "b", NA, "c"), 10)), numeric_NA_NaN = na_x,
  long = long, factor_response = frame(factor(rep(c("a", "b"), 20)), fy$y),
  explicit_response = frame(factor(rep(c("a", "b"), 20)), explicit$y),
  pure_levels = frame(factor(rep(c("a", "b"), each = 20)), rep(0:1, each = 20)))
for (case in names(factor_cases)) record("opus", case, "factor", 0,
  factor_check(factor_cases[[case]], include = !grepl("exclude", case)))
record("opus", "combine_NA_and_level", "factor_combine", 0,
       factor_check(frame(eg), combine = TRUE, selected = c("a", NA)))
astra_cases <- list(Bank = frame(mbank$age, mbank$y), Ties = frame(c(rep(0, 32), 1:8)),
  Missing = na_x, Pure = pure, One = frame(1:40, rep(1, 40)), Factor_Y = fy,
  Explicit = explicit, Long = long)
astra_cases$Missing$y[3:4] <- c(NA, NaN)
for (case in names(astra_cases)) {
  d <- astra_cases[[case]]
  for (method in names(fitters)) record("astra", case, method, if (case == "Bank") 10 else 4,
    numeric_check(d, method, if (case == "Bank") 10 else 4,
                  cuts = if (case == "Bank") c(29, 34, 40, 51, 56) else c(1, 3, 7)))
  for (method in setdiff(names(fitters), "equal_freq")) record("astra_exclude_na", case, method, if (case == "Bank") 10 else 4,
    numeric_check(d, method, if (case == "Bank") 10 else 4, include = FALSE,
                  cuts = if (case == "Bank") c(29, 34, 40, 51, 56) else c(1, 3, 7)))
  fd <- d
  fd[[2]] <- if (case == "Bank") mbank$education else if (case == "Explicit") eg else factor(d[[2]])
  record("astra", case, "factor", 0, factor_check(fd))
  record("astra", case, "factor_combine", 0, factor_check(fd, combine = TRUE,
    selected = if (case == "Bank") c("secondary", "tertiary") else if (case == "Explicit") c("a", NA) else NULL))
  record("astra_exclude_na", case, "factor", 0, factor_check(fd, include = FALSE))
  record("astra_exclude_na", case, "factor_combine", 0, factor_check(fd, include = FALSE, combine = TRUE,
    selected = if (case == "Bank") c("secondary", "tertiary") else if (case == "Explicit") c("a", NA) else NULL))
}
for (method in names(fitters)) {
  record("targeted", "exact_midpoint", method, 14,
    numeric_check(frame(c(0, 29, 58, rep(58, 11))), method, 14, rate = 0))
  record("targeted", "new_tails_gap_missing", method, 2,
    numeric_check(frame(c(0:3, NA, NaN)), method, 2, cuts = 1.5,
      new = frame(c(-100, 0, 1, 1.5, 2, 3, 100, NA, NaN))))
  if (method != "equal_freq") record("targeted", "all_missing", method, 2,
    numeric_check(frame(c(NA_real_, NaN)), method, 2, cuts = 1.5))
}
for (method in c("equal_length", "winsorize")) record("targeted", "mbank_previous_58", method, 58,
  numeric_check(frame(mbank$previous, mbank$y), method, 58, rate = 0))
out <- do.call(rbind, results)
write.csv(out, paste0(args[2], ".csv"), row.names = FALSE)
print(with(out, table(audit, status)))
print(out[out$status != "OK", ], row.names = FALSE)
cat("TOTAL:", nrow(out), "comparisons;", sum(out$status == "OK"), "OK;", sum(out$status != "OK"), "FAIL\n")
