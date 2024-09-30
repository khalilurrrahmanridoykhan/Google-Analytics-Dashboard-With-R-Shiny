library(shiny)
library(tidyverse)
library(plotly)
library(purrr)


# source_all_files <- function(directory) {
#   files <- list.files(directory, full.names = TRUE, pattern = "\\.[Rr]$")
#   for (file in files) {
#     tryCatch({
#       message("Sourcing file: ", file)
#       source(file)
#     }, error = function(e) {
#       message("Error sourcing file: ", file)
#       message("Error message: ", e$message)
#     })
#   }
# }
# source_all_files(here("./google_analytics_viz.R"))
source("google_analytics_viz.R")

list.files(here::here("R")) %>%
    here::here("R", .) %>%
    purrr::walk(~source(.))

ui <- fluidPage(

    br(),
    br(),
    div(id = "placeholder"),
    shiny::tagList(

        shiny::uiOutput(outputId = "first_plots")

    ),

    shiny::includeScript(here::here("./scripts.js"))

) 





# Define server logic required to draw a histogram
server <- function(input, output) {


    output$first_plots <- shiny::renderUI({

        purrr::pmap(
            list(
                x = c("a", "b", "c"),
                y = c("Viz 1", "Viz 2", "Viz 3")
            ),
                    function(x, y) {
            google_analytics_viz(
                title = y,
                viz = NULL,
                df = NULL,
                btn_id = x,
                class_all = "delete",
                class_specific = paste0("class_", x),
                color = "danger"
            )
        }
        )

    })

    # run when we add visualization
    shiny::observeEvent(input$add_btn_clicked, {

        # clicked id
        panel <- input$add_btn_clicked

        panel_plot_item <-
            if (exists("google_analytics_viz")) {
                google_analytics_viz(
                    title = input$header,
                    viz = NULL,
                    df = NULL,
                    btn_id = panel,
                    class_all = "delete",
                    class_specific = paste0("class_", panel),
                    color = "danger"
                )
            } else {
                print("Function google_analytics_viz is not defined.")
            }

        css_selector <- ifelse(input$last_panel == "#placeholder",
                               "#placeholder",
                               paste0(".", input$last_panel)
        )

        shiny::insertUI(
            selector = css_selector,
            "afterEnd",
            ui = panel_plot_item
        )
    })

}

# Run the application
shinyApp(ui = ui, server = server)