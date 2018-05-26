# Declaring libraries
library(shiny)
library(ggplot2)
library(dplyr)
source("analysis.R")

# Defining UI
ui <- fluidPage(
  navbarPage(
    tabsetPanel(
      tabPanel("Food Produced by Country",
               titlePanel("Food Produced by Country"),
               sidebarLayout(
                 sidebarPanel(
                   sliderInput("year", "Year:",
                               min = 1961, max = 2013, value = 1961, step = 1, animate =
                                 animationOptions(interval = 1000, loop = TRUE)),
                   selectInput("mapvar2", label = h4("Choose an Element"),
                               choices = elements), 
                   selectInput("mapvar3", label = h4("Choose an Item"),
                               choices = items)
                 ),
                 mainPanel(
                   plotlyOutput("plot")
                   
                 )
               )
      ),
      tabPanel("")
  )))

## App config
shinyUI(ui)
