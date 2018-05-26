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



food_year <- function(year_choice, element_choice = "Food", item_choice = "Total") {
  
  food_data <- group_by(data, Area.Abbreviation) %>%
    filter(Element == element_choice) %>%
    filter(Item == item_choice) %>%
    summarise_at(.vars = vars(Y1961:Y2013), sum, na.rm = TRUE)
  
  # light grey boundaries
  l <- list(color = toRGB("black"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = TRUE,
    showcoastlines = TRUE,
    projection = list(type = 'Mercator')
  )
  m <- list(
    l = 50,
    r = 50,
    b = 50,
    t = 50,
    pad = 4
  )
  plot <- plot_geo(food_data) %>%
    add_trace(z = food_data[[year_choice]], color = food_data[[year_choice]], 
              colors = 'Reds', text = ~Area.Abbreviation,
              locations = ~Area.Abbreviation, marker = list(line = l)) %>%
    colorbar(title = 'Food/Feed produced (1,000 tonnes)') %>%
    layout(
      title = 'Food and Feed Data by Country',
      geo = g, 
      autosize = F, width = 1000, height = 1000, margin = m
    )
  return(plot)
}

