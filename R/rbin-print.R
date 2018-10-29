rbin_print <- function(x) {

  mlen <- nchar(x$method)
  dlen <- mlen + 21

  cat("Binning Summary\n")
  cat(paste0(rep("-", dlen)), sep = "")
  cat("\n")
  cat(glue::glue("Method               ", x$method), "\n")
  cat(glue::glue("Response             ", x$vars[1]), "\n")
  cat(glue::glue("Predictor            ", x$vars[2]), "\n")
  cat(glue::glue("Bins                 ", length(x$bins$bin)), "\n")
  cat(glue::glue("Count                ", sum(x$bins$bin_count)), "\n")
  cat(glue::glue("Goods                ", sum(x$bins$good)), "\n")
  cat(glue::glue("Bads                 ", sum(x$bins$bad)), "\n")
  cat(glue::glue("Information Value    ", round(sum(x$bins$iv), 2)), "\n")

}


rbin_print_custom <- function(x) {

  mlen <- nchar(x$method)
  dlen <- mlen + 21

  cat("Binning Summary\n")
  cat(paste0(rep("-", dlen)), sep = "")
  cat("\n")
  cat(glue::glue("Method               ", x$method), "\n")
  cat(glue::glue("Response             ", x$vars[1]), "\n")
  cat(glue::glue("Predictor            ", x$vars[2]), "\n")
  cat(glue::glue("Levels               ", length(x$bins$level)), "\n")
  cat(glue::glue("Count                ", sum(x$bins$bin_count)), "\n")
  cat(glue::glue("Goods                ", sum(x$bins$good)), "\n")
  cat(glue::glue("Bads                 ", sum(x$bins$bad)), "\n")
  cat(glue::glue("Information Value    ", round(sum(x$bins$iv), 2)), "\n")

}
