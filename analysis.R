library(dplyr)
library(plotly)
library(ggplot2)
data <- read.csv("data/FAO.csv")


countries <- data %>%
  distinct(Area)

countries <- countries[-40, ]

items <- data %>%
  distinct(Item)

elements <- data %>%
  distinct(Element)



food_year <- function(year_choice, element_choice = "Food", item_choice = "Total") {
  
  food_data <- group_by(data, Area.Abbreviation, Area) %>%
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
  plot1 <- plot_geo(food_data) %>%
    add_trace(z = food_data[[year_choice]], color = food_data[[year_choice]], 
              colors = 'Reds', text = ~Area,
              locations = ~Area.Abbreviation, marker = list(line = l)) %>%
    colorbar(title = 'Food/Feed produced (1,000 tonnes)') %>%
    layout(
      title = 'Food and Feed Data by Country',
      geo = g, 
      autosize = F, width = 1000, height = 1000, margin = m
    )
  return(plot1)
}

country_trend <- function(country_names, element_choice = "Food", item_choice) {
 # items_list <- c("Sugar cane", "Honey")
  years <- c("2013", "2012", "2011",
             "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003","2002", "2001",
             "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993", "1992", "1991",
             "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981",
             "1980", "1979", "1978", "1977", "1976", "1975", "1974", "1973", "1972", "1971",
             "1970", "1969", "1968", "1967", "1966", "1965", "1964", "1963", "1962", "1961")
  
  country_name1 <- country_names[1]
  country_name2 <- country_names[2]
  
  country_data1 <- data %>%
    filter(Area == country_name1, Element == element_choice, Item == item_choice) %>%
    summarise_at(.vars = vars(Y1961:Y2013), sum, na.rm = TRUE)
  
  year_data1 <- stack(country_data1)
  
  country_data2 <- data %>%
    filter(Area == country_name2, Element == element_choice, Item == item_choice) %>%
    summarise_at(.vars = vars(Y1961:Y2013), sum, na.rm = TRUE)
  
  year_data2 <- stack(country_data2)
  
  plot2 <- plot_ly(x = years, y = year_data1$values, name = country_name1,
                   type = 'scatter', mode = 'lines',
                   line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
    add_trace(y = year_data2$values, name = country_name2, line = list(color = 'rgb(22, 96, 167)', width = 4))
  
  return(plot2)
    
}




