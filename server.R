# declare libraries
library(shiny)
library(plotly)
library(dplyr)
source("analysis.R")

# declare shiny server
server <- function(input, output) {
  output$plot <- renderPlotly({
    return(food_year(input$mapvar1, input$mapvar2, input$mapvar3))
  })
}

# link shiny server together
shinyServer(server)

