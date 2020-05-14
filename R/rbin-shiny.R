shiny_rbin_manual <- function(data = NULL, response = NULL, predictor = NULL, 
                              cut_points = NULL, include_na = TRUE) {
  
  resp <- response
  pred <- predictor
  
  var_names <- names(data[c(resp, pred)])
  prep_data <- data[c(resp, pred)]
  
  if (include_na) {
    bm <- prep_data
  } else {
    bm <- na.omit(prep_data)
  }
  
  colnames(bm) <- c("response", "predictor")
  
  bm$bin    <- NA
  byd       <- bm$predictor
  l_freq    <- append(min(byd, na.rm = TRUE), cut_points)
  u_freq    <- c(cut_points, (max(byd, na.rm = TRUE) + 1))
  bins      <- length(cut_points) + 1
  
  for (i in seq_len(bins)) {
    bm$bin[bm$predictor >= l_freq[i] & bm$predictor < u_freq[i]] <- i
  }
  
  k         <- bin_create(bm)
  sym_sign  <- c(rep("<", (bins - 1)), ">=")
  fbin2     <- f_bin(u_freq)
  intervals <- create_intervals(sym_sign, fbin2)
  
  if (include_na) {
    
    na_present <- nrow(k) > bins
    
    if (na_present) {
      intervals <- rbind(intervals, cut_point = 'NA')
    }
    
  }
  
  result <- list(bins = cbind(intervals, k),
                 method = "Manual",
                 vars = var_names,
                 lower_cut = l_freq,
                 upper_cut = u_freq)
  
  class(result) <- c("rbin_manual")
  return(result)
  
}


shiny_rbin_factor_combine <- function(data, var, new_var, new_name) {

  vars           <- var
  mydata         <- data[[vars]]
  current_lev    <- levels(mydata)
  l              <- length(new_var)

  for (i in seq_len(l)) {
    current_lev  <- gsub(new_var[i], new_name, current_lev)
  }

  levels(mydata) <- current_lev
  data[vars]     <- NULL
  out            <- cbind(data, mydata)
  nl             <- ncol(out)
  names(out)[nl] <- vars

  return(out)

}

shiny_rbin_factor <- function(data = NULL, response = NULL, predictor = NULL, include_na = TRUE) {

  resp <- response
  pred <- predictor

  var_names <- names(data[, c(resp, pred)])
  prep_data <- data[, c(resp, pred)]

  if (include_na) {
    bm <- prep_data
  } else {
    bm <- na.omit(prep_data)
  }

  colnames(bm) <- c("response", "predictor")

  bm <- data.table(bm)

  # group and summarize
  bm_group <- bm[, .(bin_count = .N,
                     good = sum(response == 1),
                     bad = sum(response == 0)),
                 by = predictor]

  # create new columns
  bm_group[, ':='(bin_cum_count   = cumsum(bin_count),
                  good_cum_count  = cumsum(good),
                  bad_cum_count   = cumsum(bad),
                  bin_prop        = bin_count / sum(bin_count),
                  good_rate       = good / bin_count,
                  bad_rate        = bad / bin_count,
                  good_dist       = good / sum(good),
                  bad_dist        = bad / sum(bad))]

  bm_group[, woe := log(bad_dist / good_dist)]
  bm_group[, dist_diff := bad_dist - good_dist,]
  bm_group[, iv := dist_diff * woe,]
  bm_group[, entropy := (-1) * (((good / bin_count) * log2(good / bin_count)) +
                                  ((bad / bin_count) * log2(bad / bin_count)))]
  bm_group[, prop_entropy := (bin_count / sum(bin_count)) * entropy]

  setDF(bm_group)
  colnames(bm_group)[1] <- 'level'

  result <- list(bins = bm_group, method = "Custom", vars = var_names)

  class(result) <- c("rbin_factor")
  return(result)

}

