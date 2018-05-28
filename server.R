# declare libraries
library(shiny)
library(plotly)
library(dplyr)
source("analysis.R")

# declare shiny server
server <- function(input, output) {
  
  output$plot1 <- renderPlotly({
    y <- paste0("Y", input$year)
    return(food_year(y, input$mapvar2, input$mapvar3))
  })
  
  output$plot2 <- renderPlotly({
    return(country_trend(input$country, input$element, input$item))
  })
  
}

# link shiny server together
shinyServer(server)
