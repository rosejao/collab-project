# declare libraries
library(shiny)
library(plotly)
library(dplyr)
source("analysis.R")

# declare shiny server
server <- function(input, output) {
  
  output$plot <- renderPlotly({
    y <- paste0("Y", input$year)
    return(food_year(y, input$mapvar2, input$mapvar3))
  })
  
  output$event <- renderPrint({
    d <- event_data("plotly_click")
    if (is.null(d)) "Hover on a point!" else d
  })
}

# link shiny server together
shinyServer(server)
