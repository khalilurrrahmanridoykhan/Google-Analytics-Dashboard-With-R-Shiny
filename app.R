library(shiny)
library(tidyverse)
library(plotly)
library(here)

ui <- fluidPage(
    br(),
    div(
        class = "class-a",
        div(
            class = "col-md-6 col-lg-6 col-sm-12",
            
        )
    )
)

server <- function(input, output){

}

shinyApp(ui = ui, server = server)