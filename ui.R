# Declaring libraries
library(shiny)
library(ggplot2)
library(dplyr)
source("analysis.R")

# Defining UI
ui <- fluidPage(
  navbarPage(
    tabsetPanel(
      # First page title, variables that can be changed and plot
      tabPanel("Food Produced by Country",
               titlePanel("Food Produced by Country"),
               sidebarLayout(

                 sidebarPanel(
                   sliderInput("year", "Year:",
                               min = 1961, max = 2013, value = 1961),
                   selectInput("mapvar2", label = h4("Choose an Item"),
                               choices = elements), 
                   selectInput("mapvar3", label = h4("Choose a Country"),
                               choices = countries)
                 ),
                 mainPanel(
                   plotlyOutput("plot")
                 )
               )
      )
  )))

## App config
shinyUI(ui)
