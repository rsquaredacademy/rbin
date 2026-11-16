#' Bin continuous data
#'
#' Manually bin continuous data using weight of evidence.
#'
#' @param data A \code{data.frame} or \code{tibble}, or the name of one. When
#'   \code{NULL} (the default), the current editor selection is used as the
#'   initial data name.
#'
#' @examples
#' \dontrun{
#' rbinAddin(data = mbank)
#' }
#'
#' @export
#'
rbinAddin <- function(data = NULL) {

  pkg_deps <- c("shiny", "miniUI", "rstudioapi")

  is_installed <- sapply(pkg_deps, try_pkg)
  to_install <- pkg_deps[is.na(is_installed)]

  if (length(to_install) > 0) {
    if (interactive()) {
      message('The following package(s) must be installed:', '\n')
      for (i in seq_len(length(to_install))) {
        cat(paste('-', to_install[i], '\n'))
      }
      message('\n', 'Would you like to install?')
      if (menu(c("Yes", "No")) == 1) {
        install.packages(to_install)
      } else {
        stop('Sorry! The addin cannot be launched without installing the required packages.', call. = FALSE)
      }
    }
  }

  initial <- addin_initial_data(data, deparse(substitute(data)))

  data_obj     <- initial$data
  data_name    <- initial$name
  default_name <- data_name

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Variable Binning"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Data", icon = shiny::icon("database"),
                           miniUI::miniContentPanel(
                             shiny::tabPanel('Data', value = 'tab_upload_csv',
                                             shiny::fluidPage(

                                               shiny::br(),
                                               shiny::fluidRow(
                                                 shiny::column(12, align = 'center',
                                                               shiny::textInput("mydata", "Data Name", value = data_name)
                                                 )
                                               )

                                             )
                             )
                           )
      ),
      miniUI::miniTabPanel("Variables", icon = shiny::icon("bars"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::selectInput("resp_var", "Response Variable", choices = NULL, selected = NULL),
                                               shiny::selectInput("pred_var", "Predictor Variable", choices = NULL, selected = NULL)
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("Intervals", icon = shiny::icon("scissors"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(4,
                                               shiny::h4('Cut Points'),
                                               shiny::p('For manual binning, you need to specify the cut points for the bins. `rbin`
			    								follows the left closed and right open interval for creating bins. The
                          number of cut points you specify is one less than the number of bins you
                          want to create i.e. if you want to create 10 bins, you need to specify only
                          9 cut points. View the vignette or documentation for more information.')
                                 ),
                                 shiny::column(8, align = 'center',
                                               shiny::numericInput("n_bins", "Bins", value = 5, min = 2, step = 1),
                                               shiny::br(),
                                               shiny::uiOutput("ui_bins"),
                                               shiny::br(),
                                               shiny::br(),
                                               shiny::actionButton("create_bins", "Create Bins")
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("Bins", icon = shiny::icon("table"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::verbatimTextOutput("woe_manual"),
                                               shiny::br()
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("WoE Trend", icon = shiny::icon("line-chart"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::column(12, align = 'center',
                                             shiny::plotOutput("woe", height = '500px', width = '500px')
                               )
                             )
                           )
      )
    )
  )


  server <- function(input, output, session) {

    data1 <- addin_data_reactive(input, data_obj, default_name)

    shiny::observe({

      shiny::updateSelectInput(
        session,
        inputId = "resp_var",
        choices = names(data1()),
        selected = names(data1())
      )

      shiny::updateSelectInput(
        session,
        inputId = "pred_var",
        choices = names(data1()),
        selected = names(data1())
      )

    })

    output$ui_bins <- shiny::renderUI({

      ncol <- as.integer(input$n_bins) - 1
      lapply(1:ncol, function(i) {
        shiny::fluidRow(
          shiny::column(12, align = 'center',
                        shiny::numericInput(paste("n_bins_", i),
                                            label = paste("Bin", i), value = NULL, step = 1)
          )
        )

      })

    })

    bins_values <- shiny::reactive({

      ncol <- as.integer(input$n_bins) - 1

      collect <- list(lapply(1:ncol, function(i) {
        input[[paste("n_bins_", i)]]
      }))

      unlist(collect)

    })

    compute_bins <- shiny::eventReactive(input$create_bins, {

      shiny::req(input$resp_var, input$pred_var)

      cut_points <- bins_values()

      shiny::validate(
        shiny::need(length(cut_points) == as.integer(input$n_bins) - 1,
                    "Enter a value for every cut point.")
      )

      shiny_rbin_manual(data1(), input$resp_var, input$pred_var, cut_points)
    })

    down_bins <- shiny::reactive({
      compute_bins()$bins[c('cut_point', 'bin_count', 'good', 'bad', 'woe', 'iv')]
    })

    output$woe_manual <- shiny::renderPrint({
      compute_bins()
    })

    output$woe <- shiny::renderPlot({
      graphics::plot(compute_bins())
    })

    shiny::observeEvent(input$done, {
      shiny::stopApp()
    })

  }

  launch_gadget(ui, server)

}

#' Custom binning
#'
#' Manually combine categorical variables using weight of evidence.
#'
#' @param data A \code{data.frame} or \code{tibble}, or the name of one. When
#'   \code{NULL} (the default), the current editor selection is used as the
#'   initial data name.
#'
#' @examples
#' \dontrun{
#' rbinFactorAddin(data = mbank)
#' }
#'
#' @export
#'
rbinFactorAddin <- function(data = NULL) {

  pkg_deps <- c("shiny", "miniUI", "rstudioapi")

  is_installed <- sapply(pkg_deps, try_pkg)
  to_install <- pkg_deps[is.na(is_installed)]

  if (length(to_install) > 0) {
    if (interactive()) {
      message('The following package(s) must be installed:', '\n')
      for (i in seq_len(length(to_install))) {
        cat(paste('-', to_install[i], '\n'))
      }
      message('\n', 'Would you like to install?')
      if (menu(c("Yes", "No")) == 1) {
        install.packages(to_install)
      } else {
        stop('Sorry! The addin cannot be launched without installing the required packages.', call. = FALSE)
      }
    }
  }

  initial <- addin_initial_data(data, deparse(substitute(data)))

  data_obj     <- initial$data
  data_name    <- initial$name
  default_name <- data_name

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Custom Binning"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Data", icon = shiny::icon("database"),
                           miniUI::miniContentPanel(
                             shiny::tabPanel('CSV', value = 'tab_upload_csv',
                                             shiny::fluidPage(

                                               shiny::br(),

                                               shiny::fluidRow(
                                                 shiny::column(12, align = 'center',
                                                               shiny::textInput("mydata", "Data Name", value = data_name)
                                                 )
                                               )
                                             )
                             )
                           )
      ),
      miniUI::miniTabPanel("Variables", icon = shiny::icon("bars"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::selectInput("resp_var", "Response Variable", choices = NULL, selected = NULL),
                                               shiny::selectInput("pred_var", "Predictor Variable", choices = NULL, selected = NULL)
                                 )
                               ),
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::br(),
                                               shiny::br(),
                                               shiny::actionButton("select_vars", "Select Variables")
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("Intervals", icon = shiny::icon("scissors"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(4,
                                               shiny::h4('Combine Levels'),
                                               shiny::p('Combine levels of categorical variables.')
                                 )
                               ),
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::textInput("new_lev", "New Category", value = NULL),
                                               shiny::selectInput("sel_cat", "Select Categories", choices = NULL, selected = NULL, multiple = TRUE,
                                                                  selectize = TRUE)
                                 )
                               ),
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::actionButton("create_bins", "Create Bins")
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("Bins", icon = shiny::icon("table"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::fluidRow(
                                 shiny::column(12, align = 'center',
                                               shiny::verbatimTextOutput("woe_manual"),
                                               shiny::br()
                                 )
                               )
                             )
                           )
      ),
      miniUI::miniTabPanel("WoE Trend", icon = shiny::icon("line-chart"),
                           miniUI::miniContentPanel(
                             shiny::fluidPage(
                               shiny::column(12, align = 'center',
                                             shiny::plotOutput("woe", height = '500px', width = '500px')
                               )
                             )
                           )
      )
    )
  )

  server <- function(input, output, session) {

    data1 <- addin_data_reactive(input, data_obj, default_name)

    shiny::observe({

      shiny::updateSelectInput(
        session,
        inputId = "resp_var",
        choices = names(data1()),
        selected = names(data1())
      )

      shiny::updateSelectInput(
        session,
        inputId = "pred_var",
        choices = names(data1()),
        selected = names(data1())
      )

    })

    shiny::observeEvent(input$select_vars, {

      shiny::updateSelectInput(
        session,
        inputId = "sel_cat",
        choices = levels(as.factor(data1()[[input$pred_var]])),
        selected = levels(as.factor(data1()[[input$pred_var]]))
      )

    })

    selected_levs <- shiny::reactive({
      out <- as.factor(input$sel_cat)
      return(out)
    })

    new_comb <- shiny::eventReactive(input$create_bins, {

      shiny::req(input$pred_var, input$new_lev)

      shiny_rbin_factor_combine(data1(), as.character(input$pred_var),
                                as.character(selected_levs()), as.character(input$new_lev))
    })

    woe_man <- shiny::eventReactive(input$create_bins, {
      shiny_rbin_factor(new_comb(), as.character(input$resp_var), as.character(input$pred_var))
    })

    down_bins <- shiny::reactive({
      woe_man()$bins[c('level', 'bin_count', 'good', 'bad', 'woe', 'iv')]
    })

    woe_plot <- shiny::eventReactive(input$create_bins, {
      graphics::plot(shiny_rbin_factor(new_comb(), as.character(input$resp_var),
                                       as.character(input$pred_var)))
    })

    output$woe_manual <- shiny::renderPrint({
      woe_man()
    })

    output$woe <- shiny::renderPlot({
      woe_plot()
    })

    shiny::observeEvent(input$done, {
      shiny::stopApp()
    })

  }

  launch_gadget(ui, server)

}

# Normalise the `data` argument of an addin. A data.frame is used directly (its
# expression is only used as a display name); a string is treated as the name
# of a data frame to look up later. With neither, the editor selection is used.
addin_initial_data <- function(data, name) {

  data_obj  <- NULL
  data_name <- ""

  if (inherits(data, "data.frame")) {
    data_obj  <- as.data.frame(data)
    data_name <- if (identical(name, "NULL")) "" else name
  } else if (is.character(data) && length(data) == 1L && nzchar(data)) {
    data_name <- data
  } else if (!is.null(data)) {
    stop("`data` must be a data.frame or the name of one", call. = FALSE)
  }

  if (is.null(data_obj) && !nzchar(data_name)) {
    text <- tryCatch(get_addin_context()$selection[[1]]$text,
                     error = function(e) "")
    if (length(text) == 1L && nzchar(text)) {
      data_name <- text
    }
  }

  list(data = data_obj, name = data_name)

}

# Reactive that resolves the Data Name field. A data.frame supplied when the
# addin was launched is used directly; any other name is looked up in the global
# environment. Missing or unresolved input is reported with req()/validate()
# instead of an "object not found" error.
addin_data_reactive <- function(input, data_obj, default_name) {

  shiny::reactive({

    name <- input$mydata

    if (is.null(name) || !nzchar(trimws(name))) {
      if (!is.null(data_obj)) {
        return(data_obj)
      }
      shiny::validate(
        shiny::need(FALSE, "Enter the name of a data frame in the Data tab.")
      )
    }

    name <- trimws(name)

    if (!is.null(data_obj) && identical(name, default_name)) {
      return(data_obj)
    }

    out <- tryCatch(get(name, envir = globalenv()), error = function(e) NULL)

    if (is.null(out) && !is.null(data_obj)) {
      out <- data_obj
    }

    shiny::validate(
      shiny::need(inherits(out, "data.frame"),
                  paste0("Data '", name, "' not found."))
    )

    as.data.frame(out)

  })

}

