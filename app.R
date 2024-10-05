library(shiny)
library(tidyverse)
library(plotly)
library(purrr)
library(readr)
cat("\014")

list.files("GoogleAnaliyticsDashboardWithShiny/R")  %>%
  here::here("GoogleAnaliyticsDashboardWithShiny/R") %>%
  purrr::walk(
    ~source(.)
  )

options(max.print = 1000)
web_data <- read_csv(here::here("./data/web_data.csv"))

device_category(web_data)
page_views(web_data)
channel_groupings(web_data)
ui <- fluidPage(
  br(),
  br(),
  div(id = "placeholder"),
  main_viz_ui(id = "main_viz"),
  shiny::includeScript(here::here("./scripts.js"))
)





# Define server logic required to draw a histogram
server <- function(input, output) {
  main_viz_server(
    id = "main_viz",
    df = web_data,
    add_btn_clicked = shiny::reactive(input$add_btn_clicked),
    header = shiny::reactive(input$header),
    last_panel = shiny::reactive(input$last_panel)
  )
}
shiny::shinyOptions(warnOnDuplicateIDs = FALSE)

# Run the application
shinyApp(ui = ui, server = server)
