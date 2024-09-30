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
      div(
        class = "panel panel-default",
        div(
          class = "panel-heading clearfix",
          tags$h2("Viz 1", class = "pull-left panel-title"),
          div(
            class = "pull-right",
            shiny::actionButton(
              inputId = "a",
              label = "",
              class = "btn-danger delete",
              icon = shiny::icon("minus")
            )
          )
        ),
        div(
          class = "panel-body",
          plotly::plot_ly(
            mtcars,
            x = ~mpg, y = ~hp, type = "scatter", mode = "markers"
          )
        )
      )
    )
  ),
  div(
    class = "class-b",
    div(
      class = "col-md-6 col-lg-6 col-sm-12",
      div(
        class = "panel panel-default",
        div(
          class = "panel-heading clearfix",
          tags$h2("Viz 2", class = "pull-left panel-title"),
          div(
            class = "pull-right",
            shiny::actionButton(
              inputId = "b",
              label = "",
              class = "btn-danger delete",
              icon = shiny::icon("minus")
            )
          )
        ),
        div(
          class = "panel-body",
          plotly::plot_ly(
            mtcars,
            x = ~mpg, y = ~hp, type = "scatter", mode = "markers"
          )
        )
      )
    )
  ),
  div(
    class = "class-c",
    div(
      class = "col-md-6 col-lg-6 col-sm-12",
      div(
        class = "panel panel-default",
        div(
          class = "panel-heading clearfix",
          tags$h2("Viz 3", class = "pull-left panel-title"),
          div(
            class = "pull-right",
            shiny::actionButton(
              inputId = "c",
              label = "",
              class = "btn-danger delete",
              icon = shiny::icon("minus")
            )
          )
        ),
        div(
          class = "panel-body",
          plotly::plot_ly(
            mtcars,
            x = ~mpg, y = ~wt, type = "scatter", mode = "markers"
          )
        )
      )
    )
  ),
  shiny::includeScript(here::here("./scripts.js"))
)

server <- function(input, output) {

}

shinyApp(ui = ui, server = server)
