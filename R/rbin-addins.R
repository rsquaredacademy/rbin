#' Bin continuous data
#'
#' Manually bin continuous data using weight of evidence.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#'
#' @examples
#' \dontrun{
#' rbinAddin(data = mbank)
#' }
#'
#' @export
#'
rbinAddin <- function(data = NULL) {

	context <- rstudioapi::getActiveDocumentContext()
  text <- context$selection[[1]]$text
  default_data <- text

    if (is.null(data)) {
         if (nzchar(default_data)) {
              data <- default_data
         } 
    }

    if (any(class(data) %in% c("data.frame","tibble","tbl_df"))) {
         mydata <- deparse(substitute(data))
    } else if (class(data) == "character") {
      result <- tryCatch(eval(parse(text = data)), error = function(e) "error")
      if (any(class(result) %in% c("data.frame","tibble","tbl_df"))) {
      	mydata <- data
      } else {
      	return(NULL)
      }
		}

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
			  					shiny::textInput("mydata", "Data Name", value = mydata)
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

	data1 <- shiny::reactive({
	  out <- get(input$mydata)
	  return(out)
	})

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
      rbin_manual(data1(), input$resp_var, input$pred_var, bins_values())
	})

	down_bins <- shiny::reactive({
		compute_bins() %>%
		  magrittr::use_series(bins) %>%
		  dplyr::select(cut_point, bin_count, good, bad, woe, iv)
	})

	output$woe_manual <- shiny::renderPrint({
	  compute_bins() 
	})

	output$woe <- shiny::renderPlot({
	  graphics::plot(compute_bins())
	})

	create_woe <- shiny::reactive({
	  rbin_create(data1(), input$pred_var, compute_bins())
	})

  shiny::observeEvent(input$done, {
    shiny::stopApp()
  })

  }

  shiny::runGadget(ui, server, viewer = shiny::browserViewer())

}

#' Custom binning
#'
#' Manually combine categorical variables using weight of evidence.
#'
#' @param data A \code{data.frame} or \code{tibble}.
#'
#' @examples
#' \dontrun{
#' rbinFactorAddin(data = mbank)
#' }
#'
#' @export
#'
rbinFactorAddin <- function(data = NULL) {

	  context <- rstudioapi::getActiveDocumentContext()
    text <- context$selection[[1]]$text
    default_data <- text

    if (is.null(data)) {
         if(nzchar(default_data)) {
              data <- default_data
         } 
    }

    if (any(class(data) %in% c("data.frame","tibble","tbl_df"))) {
         mydata <- deparse(substitute(data))
    } else if (class(data) == "character") {
      result <- tryCatch(eval(parse(text = data)), error = function(e) "error")
      if (any(class(result) %in% c("data.frame","tibble","tbl_df"))) {
      	mydata <- data
      } else {
      	return(NULL)
      }
		}

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
			  					shiny::textInput("mydata", "Data Name", value = mydata)
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

	data1 <- shiny::reactive({
	  out <- get(input$mydata)
	  return(out)
	})

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
	    choices = levels(as.factor(dplyr::pull(data1(), input$pred_var))),
	    selected = levels(as.factor(dplyr::pull(data1(), input$pred_var)))
	  )

	})

	selected_levs <- shiny::reactive({
		out <- as.factor(input$sel_cat)
		return(out)
	})

	new_comb <- shiny::eventReactive(input$create_bins, {
		rbin_factor_combine(data1(), !! rlang::sym(as.character(input$pred_var)), as.character(selected_levs()), as.character(input$new_lev))
	})

	woe_man <- shiny::eventReactive(input$create_bins, {
		rbin_factor(new_comb(), !! rlang::sym(as.character(input$resp_var)), !! rlang::sym(as.character(input$pred_var)))
	})

	down_bins <- shiny::reactive({
		woe_man() %>%
		  magrittr::use_series(bins) %>%
		  dplyr::select(level, bin_count, good, bad, woe, iv)
	})

	woe_plot <- shiny::eventReactive(input$create_bins, {
		graphics::plot(rbin_factor(new_comb(), !! rlang::sym(as.character(input$resp_var)), !! rlang::sym(as.character(input$pred_var))))
	})

	output$woe_manual <- shiny::renderPrint({
		woe_man()
	})

	output$woe <- shiny::renderPlot({
	  woe_plot()
	})

	create_woe <- shiny::reactive({
	  rbin_factor_create(new_comb(), !! rlang::sym(as.character(input$pred_var)))
	})

  shiny::observeEvent(input$done, {
    shiny::stopApp()
  })

  }

  shiny::runGadget(ui, server, viewer = shiny::browserViewer())

}

