# Workers used by the RStudio addins.
#
# They are thin wrappers around the shared implementations so that the addins
# and the exported functions validate input, drop missing responses and compute
# the summary statistics in exactly the same way.

shiny_rbin_manual <- function(data = NULL, response = NULL, predictor = NULL,
                              cut_points = NULL, include_na = TRUE) {

  rbin_manual_impl(data       = data,
                   response   = response,
                   predictor  = predictor,
                   cut_points = cut_points,
                   include_na = include_na)

}

shiny_rbin_factor_combine <- function(data, var, new_var, new_name) {

  rbin_factor_combine_impl(data     = data,
                           var      = var,
                           new_var  = new_var,
                           new_name = new_name)

}

shiny_rbin_factor <- function(data = NULL, response = NULL, predictor = NULL,
                              include_na = TRUE) {

  rbin_factor_impl(data       = data,
                   response   = response,
                   predictor  = predictor,
                   include_na = include_na)

}

# Indirection for desktop-only calls so that the addins can be tested without
# an RStudio session.
get_addin_context <- function() {
  rstudioapi::getActiveDocumentContext()
}

launch_gadget <- function(ui, server) {
  shiny::runGadget(ui, server, viewer = shiny::browserViewer())
}
