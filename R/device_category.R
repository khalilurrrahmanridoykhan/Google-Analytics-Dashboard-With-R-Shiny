library(dplyr)
library(plotly)

device_category <- function(df){ # nolint

  df_plot <- df %>%
    dplyr::group_by(device_category) %>%  # nolint
    dplyr::summarise(
      n = dplyr::n()
    ) %>%  # nolint
    dplyr::ungroup() %>%
    dplyr::mutate(prop = round(n / sum(n) * 100, 2))

  final_plot <- plot_ly(
    df_plot,
    labels = ~ device_category,
    values = ~ prop,
    type = "pie"
  )

  return(final_plot)

}