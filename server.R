library(shiny)
library(ggplot2)
library(dplyr)

## create shiny server
server <- function(input, output) {
  
  ## Render a plotly object that returns your map
  output$p <- renderPlot({
    return()
  })
  
  output$plot <- renderPlot({
    return()
  })
}

## link shiny together
shinyServer(server)
