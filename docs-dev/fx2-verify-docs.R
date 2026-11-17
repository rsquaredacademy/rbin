library(rbin)
options(width = 80)
fixtures <- list(
  rbin_manual = rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56)),
  rbin_equal_length = rbin_equal_length(mbank, y, age, 10),
  rbin_quantiles = rbin_quantiles(mbank, y, age, 10),
  rbin_winsorize = rbin_winsorize(mbank, y, age, 10, winsor_rate = .05),
  rbin_equal_freq = rbin_equal_freq(mbank, y, age, 10),
  rbin_factor = rbin_factor(mbank, y, education))
for (name in names(fixtures)) {
  html <- xml2::read_html(file.path("docs/reference", paste0(name, ".html")))
  actual <- trimws(sub("^#> ?", "", xml2::xml_text(xml2::xml_find_all(html,
    "//span[contains(concat(' ', normalize-space(@class), ' '), ' r-out ')]"))))
  expected <- trimws(capture.output(print(fixtures[[name]])))
  expected <- expected[nzchar(expected)]
  missing <- expected[!expected %in% actual]
  if (length(missing)) {
    cat(name, "missing lines:\n"); print(missing)
    stop("reference example output differs")
  }
  md <- readLines(file.path("docs/reference", paste0(name, ".md")))
  actual_md <- trimws(sub("^#> ?", "", md))
  stopifnot(all(expected %in% actual_md))
  cat(name, ": every printed summary line matches HTML and Markdown\n")
}
# The tie-aware example also appears in the README and introductory article.
expected <- trimws(capture.output(print(fixtures$rbin_equal_freq)))
expected <- expected[nzchar(expected)]
stopifnot(identical(fixtures$rbin_equal_freq$bins$bin_count,
                   c(521L, 386L, 582L, 374L, 497L, 396L, 461L, 474L, 441L, 389L)))
for (path in c("README.md", "docs/articles/introduction.md")) {
  # pkgdown's article Markdown wraps output in backticks and uses NBSPs.
  actual <- chartr("\u00a0", " ", readLines(path, encoding = "UTF-8"))
  actual <- gsub("`", "", actual, fixed = TRUE)
  actual <- sub("\\\\$", "", actual)
  actual <- trimws(sub("^#> ?", "", actual))
  if (!all(expected %in% actual)) print(expected[!expected %in% actual])
  stopifnot(all(expected %in% actual))
}
for (path in c("docs/index.html", "docs/articles/introduction.html")) {
  html <- xml2::read_html(path)
  actual <- trimws(sub("^#> ?", "", xml2::xml_text(xml2::xml_find_all(html,
    "//span[contains(concat(' ', normalize-space(@class), ' '), ' r-out ') or contains(concat(' ', normalize-space(@class), ' '), ' co ')]"))))
  if (!all(expected %in% actual)) print(expected[!expected %in% actual])
  stopifnot(all(expected %in% actual))
}
cat("Tie-aware equal-frequency summaries match README and article outputs.\n")
for (path in c("docs/reference/mbank.html", "docs/reference/mbank.md")) {
  content <- paste(readLines(path), collapse = " ")
  stopifnot(!grepl("day_of_week", content, fixed = TRUE),
            grepl("balance", content, fixed = TRUE))
}
for (path in c("docs/news/index.html", "docs/news/index.md")) {
  stopifnot(grepl("0.3.0", paste(readLines(path), collapse = " "), fixed = TRUE))
}
for (path in c("docs/reference/rbin_create.html", "docs/reference/rbin_create.md")) {
  stopifnot(!grepl("rbin_winsorized", paste(readLines(path), collapse = " "), fixed = TRUE))
}
cat("All generated documentation checks passed.\n")
