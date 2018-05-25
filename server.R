<<<<<<< HEAD
# declare libraries
library(shiny)
library(plotly)
library(dplyr)
source("analysis.R")

# declare shiny server
server <- function(input, output) {
  
  output$plot <- renderPlotly({
    y <- paste0("sum(Y", input$year, ")")
    print(y)
    return(food_year(y, input$mapvar2, "asdf"))
  })
}

# link shiny server together
shinyServer(server)
