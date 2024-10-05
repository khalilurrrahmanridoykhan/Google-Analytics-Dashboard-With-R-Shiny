main_viz_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::uiOutput(outputId = ns("first_plots"))
  )
}

main_viz_server <- function(id, df, add_btn_clicked, header, last_panel) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      output$first_plots <- shiny::renderUI({
        purrr::pmap(
          list(
            x = c("a", "b", "c"),
            y = c("Page Views", "Device Category", "Channel Groupings")
          ),
          function(x, y) {
            google_analytics_viz( # nolint
              title = y,
              viz = y,
              df = df,
              btn_id = x,
              class_all = "delete",
              class_specific = paste0("class_", x),
              color = "danger"
            )
          }
        )
      })

      # run when we add visualization
      shiny::observeEvent(add_btn_clicked(), {
        # clicked id
        panel <- add_btn_clicked()

        panel_plot_item <-
          if (exists("google_analytics_viz")) {
            google_analytics_viz(
              title = header(),
              viz = header(),
              df = df,
              btn_id = panel,
              class_all = "delete",
              class_specific = paste0("class_", panel),
              color = "danger"
            )
          } else {
            print("Function google_analytics_viz is not defined.")
          }

        css_selector <- ifelse(last_panel() == "#placeholder",
          "#placeholder",
          paste0(".", last_panel())
        )

        shiny::insertUI(
          selector = css_selector,
          "afterEnd",
          ui = panel_plot_item
        )
      })
    }
  )
}
