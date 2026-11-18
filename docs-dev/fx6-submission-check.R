# cran-comments.md is excluded from the installed package. Check its exact
# submission-policy text separately from the package's behavioral tie test.
args <- commandArgs(TRUE)
text <- paste(readLines(file.path(args[1], "cran-comments.md")), collapse = " ")
stopifnot(grepl("keep tied values together", text, fixed = TRUE),
          grepl("approximately", text, fixed = TRUE),
          grepl("message reporting the requested and actual bin counts", text, fixed = TRUE),
          !grepl("ambiguous tied rank scoring errors", text, fixed = TRUE))
cat("CRAN tie-policy text: 4 value assertions passed\n")
