library(dplyr)
library(plotly)
library(ggplot2)
data <- read.csv("data/FAO.csv")



years <- list("Y1961" = "Y1961", "Y1962" = "Y1962")

countries <- data %>%
  distinct(Area)

countries <- head(countries, n = 10)

items <- data %>%
  distinct(Item)

food_data <- group_by(data, Area) %>%
  filter(Element == "Food") %>%
  summarise("total" = sum(Y1961))

df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')


food_year <- function(year_choice, item_choice, country_choice) {
  
  
  # light grey boundaries
  l <- list(color = toRGB("grey"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  plot <- plotly(df) %>%
    add_trace(
      z = ~GDP..BILLIONS., color = ~GDP..BILLIONS., colors = 'Blues',
      text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
    ) %>%
    colorbar(title = 'GDP Billions US$', tickprefix = '$') %>%
    layout(
      title = '2014 Global GDP',
      geo = g
    )
  return(plot)
}

