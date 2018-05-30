## Set up
library(dplyr)
library(plotly)
library(ggplot2)
data <- read.csv("data/FAO.csv")

## deleting Cote d'Ivoire data because the name is corupted
## had to hard coded (DONT RUN AGAIN)
data <- data[-c(4789:4907), ]

## getting all countries
countries <- data %>%
  distinct(Area)

## getting all distinct items in dataset
items <- data %>%
  distinct(Item)

## getting the two distinct elements in dataset
elements <- data %>%
  distinct(Element)


## returns a map displaying the food/feed produced by country

food_year <- function(year_choice, element_choice = "Food", item_choice) {
  food_data <- group_by(data, Area.Abbreviation, Area) %>%
    filter(Element == element_choice) %>%
    filter(Item == item_choice) %>%
    summarise_at(.vars = vars(Y1961:Y2013), sum, na.rm = TRUE)

  ## light grey boundaries
  l <- list(color = toRGB("black"), width = 0.5)

  ## specify map projection/options
  g <- list(
    showframe = TRUE,
    showcoastlines = TRUE,
    projection = list(type = "Mercator")
  )
  m <- list(
    l = 50,
    r = 50,
    b = 80,
    t = 80,
    pad = 4
  )
  plot1 <- plot_geo(food_data) %>%
    add_trace(
      z = food_data[[year_choice]], color = food_data[[year_choice]],
      colors = "Greens", text = ~ Area,
      locations = ~ Area.Abbreviation, marker = list(line = l)
    ) %>%
    colorbar(title = "Tonnes of Food/Feed Produced (thousands)") %>%
    layout(
      paper_bgcolor = "rgba(0,0,0,0)",
      plot_bgcolor = "rgba(0,0,0,0)",
      title = "Food and Feed Data by Country",
      geo = g,
      autosize = F, width = 1000, height = 3, margin = m
    )
  return(plot1)
}

## returns a line graph that shows the food/feed trend over the years by country
## two countries can be selected at once to compare data
## a single item can be selected to compare countries by item
country_trend <- function(country_names, element_choice = "Food", 
                          item_choice) {
  years <- c(
    "2013", "2012", "2011",
    "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003",
    "2002", "2001",
    "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993",
    "1992", "1991",
    "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983",
    "1982", "1981",
    "1980", "1979", "1978", "1977", "1976", "1975", "1974", "1973",
    "1972", "1971",
    "1970", "1969", "1968", "1967", "1966", "1965", "1964", "1963",
    "1962", "1961"
  )
  
  ## Getting the first and second countries selected by user
  country_name1 <- country_names[1]
  country_name2 <- country_names[2]

  ## Getting trend data for first country
  country_data1 <- data %>%
    filter(Area == country_name1, Element == element_choice,
           Item == item_choice) %>%
    summarise_at(.vars = vars(Y2013:Y1961), sum, na.rm = TRUE)
  
  ## Stacking data to group 
  year_data1 <- stack(country_data1)
  
  ## Getting trend data for second country
  country_data2 <- data %>%
    filter(Area == country_name2, Element == element_choice,
           Item == item_choice) %>%
    summarise_at(.vars = vars(Y2013:Y1961), sum, na.rm = TRUE)
  
  ## Stacking data to group
  year_data2 <- stack(country_data2)
  
  x <- list(
    title = "Year"
  )
  y <- list(
    title = "Tonnes Produced (thousands)"
  )
  
  ## Trend of country food and feed across decades to present on map
  plot2 <- plot_ly(
    x = years, y = year_data1$values, name = country_name1,
    type = "scatter", mode = "lines",
    line = list(color = "rgb(205, 12, 24)", width = 4)
  ) %>%
    add_trace(y = year_data2$values, name = country_name2, 
              line = list(color = "rgb(22, 96, 167)", width = 4)) %>% 
    layout(title = "Country Production Comparison",
      xaxis = x, yaxis = y,
      autosize = T,
          margin = list(b = 90, r = 80, l =80, t = 90), 
      list(t = 100), pad = 6, xaxis = list(tickangle = 45))
  
  return(plot2)
}

## returns a bar plot with the top five countries that produce the food/feed of
## the selected item and year. Defaults element to "Food"
top_countries <- function(element_choice = "Food", item_choice, year_choice) {
  
  ## Getting the top 5 countries filtering by given element, item and year
  top <- data %>%
    filter(Element == element_choice, Item == item_choice) %>%
    select(Area, c(year_choice)) %>%
    top_n(n = 5)
  
  ## Getting x labels
  x <- as.vector(top$Area)

  ## Making bar plot
  plot3 <- plot_ly(x = x, y = top[, 2],  type = "bar", color ="Reds") %>%
    layout(title = "Top Producing Countries per Item",
           yaxis = list(title = "Tonnes Produced (thousands)"),
           xaxis = list(title = "Country"),
           autosize = F,
           margin = list(b = 90, r = 80, l =80, t = 90), 
           list(r = 90), xaxis = list(tickangle = 15))
  
  return(plot3)
}

## returns a bar plot with the top five items that produce the food/feed of
## the selected country and year. Defaults element to "Food"
top_items <- function(element_choice = "Food", country_choice, year_choice) {
  
  ## Getting the top 5 items. filtering by given element, country and year
  top <- data %>%
    filter(Element == element_choice, Area == country_choice) %>%
    select(Item, c(year_choice)) %>%
    top_n(n = 5)
  
  ## Getting x labels 
  x <- as.vector(top$Item)
  
  ## Making bar plot
  plot4 <- plot_ly(x = x, y = top[, 2],  type = "bar", color ="Greens") %>%
    layout(title = "Top Produced Items per Country",
           yaxis = list(title = 'Tonnes Produced (thousands)'),
           xaxis = list(title = 'Item'),
           autosize = T,
           margin = list(b = 120, r = 80, l =80, t = 90),
           xaxis = list(tickangle = 20))
  
  
  return(plot4)
}
