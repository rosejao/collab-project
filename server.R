## declare libraries
library(shiny)
library(plotly)
library(dplyr)
source("analysis.R")

## declare shiny server
server <- function(input, output) {
  output$plot1 <- renderPlotly({
    year <- paste0("Y", input$year)
    return(food_year(year, input$mapvar2, input$mapvar3))
  })

  output$plot2 <- renderPlotly({
    validate(
      need(input$country != "", "Please use the selection widget on the left")
    )
    return(country_trend(input$country, input$element, input$item))
  })

  output$plot3 <- renderPlotly({
    year <- paste0("Y", input$year2)
    return(top_countries(input$element2, input$item2, year))
  })

  output$plot4 <- renderPlotly({
    year <- paste0("Y", input$year3)
    return(top_items(input$element3, input$country2, year))
  })
}

## link shiny server together
shinyServer(server)
