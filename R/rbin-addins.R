#' Bin variables
#'
#' Manually bin variables using weight of evidence.
#'
#' @examples
#' \dontrun{
#' rbinAddin()
#' }
#'
#' @export
#'
rbinAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Variable Binning"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Data", icon = shiny::icon("database"),
        miniUI::miniContentPanel(
          shiny::tabPanel('CSV', value = 'tab_upload_csv',
			shiny::fluidPage(

			  shiny::br(),

              shiny::fluidRow(
			    shiny::column(8, align = 'left',
			      shiny::h4('Upload Data'),
			      shiny::p('Upload data from a comma or tab separated file.')
			    )
			  ),

			  shiny::hr(),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::fileInput('file1', 'Data Set:',
			        accept = c('text/csv', '.csv', 'text/comma-separated-values,text/plain')
			      )
			    )
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',  shiny::checkboxInput('header', 'Header', TRUE))
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::selectInput('sep', 'Separator',
			        choices = c('Comma' = ',', 'Semicolon' = ';', 'Tab' = '\t'), selected = ',')
			    )
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::selectInput('quote', 'Quote',
			        choices = c('None' = '', 'Double Quote' = '"', 'Single Quote' = "'"), selected = '')
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
			    			shiny::p('Specify the upper open interval for each bin. If you want to create_bins
			      		10 bins, the app will show you only 9 input boxes. The interval for the 10th bin 
			      		is automatically computed. For example, if you want the first bin to have all the
			      		values between the minimum and including 36, then you will enter the value 37 in Bin 1.')
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
      		    shiny::br(), 
      		    shiny::textInput("bins_name", "File Name"),
      		    shiny::downloadButton("download_bins", "Download")
      		  )
      	    )
      	  )
      	)
      ),
      miniUI::miniTabPanel("WoE Trend", icon = shiny::icon("line-chart"),
      	miniUI::miniContentPanel(
      	  shiny::fluidPage(
      	    shiny::fluidRow(
      	      shiny::column(4, align = 'center',
      	      	shiny::textInput("plot_name", "Plot Name"),
      		    shiny::downloadButton("download_plot", "Download")
      	      ),
      	      shiny::column(8, align = 'center',
      		    shiny::plotOutput("woe",, height = '500px', width = '500px')
      		  )
      		)
      	  )
      	)
      ),
      miniUI::miniTabPanel("Download", icon = shiny::icon("download"),
      	miniUI::miniContentPanel(
          shiny::fluidPage(
      	    shiny::fluidRow(
      	      shiny::column(12, align = 'center',
      	        shiny::textInput("file_name", "File Name"),
      	        shiny::downloadButton("download_woe", "Download")
      	      )
      	    )
      	  )
      	)
      )
    )
  )

  server <- function(input, output, session) {

  	inFile1 <- shiny::reactive({
	    if(is.null(input$file1)) {
	        return(NULL)
	    } else {
	        input$file1
	    }
	})

	data1 <- shiny::reactive({
	    if(is.null(inFile1())) {
	        return(NULL)
	    } else {
	        utils::read.csv(inFile1()$datapath,
	            header = input$header,
	            sep = input$sep,
	            quote = input$quote)
	    }
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

	down_bins <- reactive({
		compute_bins() %>%
		  use_series(bins) %>%
		  select(cut_point, bin_count, good, bad, woe, iv)
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

	output$download_woe <- shiny::downloadHandler(
	    filename = function() {
	      paste(input$file_name, ".csv", sep = "")
	    },
	    content = function(file) {
	      utils::write.csv(create_woe(), file, row.names = FALSE)
	    }
	  )

	output$download_bins <- shiny::downloadHandler(
	  filename = function() {
	    paste(input$bins_name, ".csv", sep = "")
	  },
	  content = function(file) {
	    utils::write.csv(down_bins(), file, row.names = FALSE)
	  }
	)

	output$download_plot <- shiny::downloadHandler(
	  filename = function() {
	    paste0(input$plot_name, ".png")
	  },
	  content = function(file) {
	    ggplot2::ggsave(file, graphics::plot(compute_bins()), width = 16, height = 10.4)
	  }
	)

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
#' @examples
#' \dontrun{
#' rbinFactorAddin()
#' }
#'
#' @export
#'
rbinFactorAddin <- function() {

  ui <- miniUI::miniPage(
    miniUI::gadgetTitleBar("Custom Binning"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Data", icon = shiny::icon("database"),
        miniUI::miniContentPanel(
          shiny::tabPanel('CSV', value = 'tab_upload_csv',
			shiny::fluidPage(

			  shiny::br(),

              shiny::fluidRow(
			    shiny::column(8, align = 'left',
			      shiny::h4('Upload Data'),
			      shiny::p('Upload data from a comma or tab separated file.')
			    )
			  ),

			  shiny::hr(),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::fileInput('file1', 'Data Set:',
			        accept = c('text/csv', '.csv', 'text/comma-separated-values,text/plain')
			      )
			    )
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',  shiny::checkboxInput('header', 'Header', TRUE))
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::selectInput('sep', 'Separator',
			        choices = c('Comma' = ',', 'Semicolon' = ';', 'Tab' = '\t'), selected = ',')
			    )
			  ),

			  shiny::fluidRow(
			    shiny::column(12, align = 'center',
			      shiny::selectInput('quote', 'Quote',
			        choices = c('None' = '', 'Double Quote' = '"', 'Single Quote' = "'"), selected = '')
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
      		    shiny::br(), 
      		    shiny::textInput("bins_name", "File Name"),
      		    shiny::downloadButton("download_bins", "Download")
      		  )
      	    )
      	  )
      	)
      ),
      miniUI::miniTabPanel("WoE Trend", icon = shiny::icon("line-chart"),
      	miniUI::miniContentPanel(
      	  shiny::fluidPage(
      	    shiny::fluidRow(
      	      shiny::column(4, align = 'center',
      	      	shiny::textInput("plot_name", "Plot Name"),
      		      shiny::downloadButton("download_plot", "Download")
      	      ),
      	      shiny::column(8, align = 'center',
      		     shiny::plotOutput("woe",, height = '500px', width = '500px')
      		    )
      		  )
      	  )
      	)
      ),
      miniUI::miniTabPanel("Download", icon = shiny::icon("download"),
      	miniUI::miniContentPanel(
          shiny::fluidPage(
      	    shiny::fluidRow(
      	      shiny::column(12, align = 'center',
      	        shiny::textInput("file_name", "File Name"),
      	        shiny::downloadButton("download_woe", "Download")
      	      )
      	    )
      	  )
      	)
      )
    )
  )

  server <- function(input, output, session) {

  	inFile1 <- shiny::reactive({
	    if(is.null(input$file1)) {
	        return(NULL)
	    } else {
	        input$file1
	    }
	})

	data1 <- shiny::reactive({
	    if(is.null(inFile1())) {
	        return(NULL)
	    } else {
	        utils::read.csv(inFile1()$datapath,
	            header = input$header,
	            sep = input$sep,
	            quote = input$quote)
	    }
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

	observeEvent(input$select_vars, {

		shiny::updateSelectInput(
	  	session,
	    inputId = "sel_cat",
	    choices = levels(as.factor(pull(data1(), input$pred_var))),
	    selected = levels(as.factor(pull(data1(), input$pred_var)))
	  )

	})

	selected_levs <- reactive({
		out <- input$sel_cat
		return(out)
	})

	new_comb <- shiny::eventReactive(input$create_bins, {
		rbin_factor_combine(data1(), !! sym(as.character(input$pred_var)), selected_levs(), input$new_lev)
	})

	woe_man <- shiny::eventReactive(input$create_bins, {
		rbin_factor(new_comb(), !! sym(as.character(input$resp_var)), !! sym(as.character(input$pred_var)))
	})

	down_bins <- reactive({
		woe_man() %>%
		  use_series(bins) %>%
		  select(level, bin_count, good, bad, woe, iv)
	})

	woe_plot <- shiny::eventReactive(input$create_bins, {
		graphics::plot(rbin_factor(new_comb(), !! sym(as.character(input$resp_var)), !! sym(as.character(input$pred_var))))
	})

	output$woe_manual <- shiny::renderPrint({
		woe_man()
	})

	output$woe <- shiny::renderPlot({
	  woe_plot()
	})

	create_woe <- shiny::reactive({
	  rbin_factor_create(new_comb(), !! sym(as.character(input$pred_var)))
	})

	output$download_woe <- shiny::downloadHandler(
	    filename = function() {
	      paste(input$file_name, ".csv", sep = "")
	    },
	    content = function(file) {
	      utils::write.csv(create_woe(), file, row.names = FALSE)
	    }
	  )

	output$download_bins <- shiny::downloadHandler(
	  filename = function() {
	    paste(input$bins_name, ".csv", sep = "")
	  },
	  content = function(file) {
	    utils::write.csv(down_bins(), file, row.names = FALSE)
	  }
	)

	output$download_plot <- shiny::downloadHandler(
	  filename = function() {
	    paste0(input$plot_name, ".png")
	  },
	  content = function(file) {
	    ggplot2::ggsave(file, woe_plot(), width = 16, height = 10.4)
	  }
	)

    shiny::observeEvent(input$done, {
      shiny::stopApp()
    })

  }

  shiny::runGadget(ui, server, viewer = shiny::browserViewer())

}

