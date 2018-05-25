library(dplyr)
library(plotly)
library(ggplot2)
data <- read.csv("data/FAO.csv")


countries <- data %>%
  distinct(Area)

countries <- head(countries, n = 10)

items <- data %>%
  distinct(Item)

elements <- data %>%
  distinct(Element)



food_year <- function(year_choice, element_choice = "Food", country_choice) {
  
  food_data <- group_by(data, Area.Abbreviation) %>%
    filter(Element == element_choice) %>%
    summarise(sum(Y1961), sum(Y1962), sum(Y2013))
  
  # light grey boundaries
  l <- list(color = toRGB("grey"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 100,
    pad = 4
  )
  plot <- plot_geo(food_data) %>%
    add_trace(z = food_data[[year_choice]], color = food_data[[year_choice]], 
              colors = 'Reds', text = ~Area.Abbreviation,
              locations = ~Area.Abbreviation, marker = list(line = l)) %>%
    colorbar(title = 'Food levels in thousands') %>%
    layout(
      title = 'Food data by Country',
      geo = g, 
      autosize = F, width = 500, height = 500, margin = m
    )
  return(plot)
}

food_year('sum(Y1988)', "asdf", "asdf")

