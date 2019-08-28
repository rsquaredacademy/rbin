rbin_print <- function(x) {

  mlen <- nchar(x$method)
  dlen <- mlen + 21

  cat("Binning Summary\n")
  cat(paste0(rep("-", dlen)), sep = "")
  cat("\n")
  cat(paste0("Method               ", x$method), "\n")
  cat(paste0("Response             ", x$vars[1]), "\n")
  cat(paste0("Predictor            ", x$vars[2]), "\n")
  cat(paste0("Bins                 ", length(x$bins$bin)), "\n")
  cat(paste0("Count                ", sum(x$bins$bin_count)), "\n")
  cat(paste0("Goods                ", sum(x$bins$good)), "\n")
  cat(paste0("Bads                 ", sum(x$bins$bad)), "\n")
  cat(paste0("Entropy              ", round(sum(x$bins$prop_entropy), 2)), "\n")
  cat(paste0("Information Value    ", round(sum(x$bins$iv), 2)), "\n")

}


rbin_print_custom <- function(x) {

  mlen <- nchar(x$method)
  dlen <- mlen + 21

  cat("Binning Summary\n")
  cat(paste0(rep("-", dlen)), sep = "")
  cat("\n")
  cat(paste0("Method               ", x$method), "\n")
  cat(paste0("Response             ", x$vars[1]), "\n")
  cat(paste0("Predictor            ", x$vars[2]), "\n")
  cat(paste0("Levels               ", length(x$bins$level)), "\n")
  cat(paste0("Count                ", sum(x$bins$bin_count)), "\n")
  cat(paste0("Goods                ", sum(x$bins$good)), "\n")
  cat(paste0("Bads                 ", sum(x$bins$bad)), "\n")
  cat(paste0("Entropy              ", round(sum(x$bins$prop_entropy), 2)), "\n")
  cat(paste0("Information Value    ", round(sum(x$bins$iv), 2)), "\n")

}
