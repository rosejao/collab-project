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
                   selectInput("mapvar1", label = h4("Choose a Year"),
                               choices = years), 
                   selectInput("mapvar2", label = h4("Choose an Item"),
                               choices = items), 
                   selectInput("mapvar3", label = h4("Choose a Country"),
                               choices = countries)
                 ),
                 mainPanel(
                   plotOutput("plot")
                 )
               )
      )
  )))

## App config
shinyUI(ui)
