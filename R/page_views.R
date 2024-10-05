library(dplyr)
library(plotly)
library(htmlwidgets)
page_views <- function(df) {
  df_plot <- df %>%
    dplyr::group_by(date) %>%
    dplyr::summarise(
      sum_page_views = sum(pageviews) # nolint
    )  %>%
    dplyr::ungroup()

  final_plot <- plotly::plot_ly(
    df_plot, # nolint
    x = ~ date,
    y = ~ sum_page_views)  %>%
    plotly::add_lines()

  return(final_plot)

}
