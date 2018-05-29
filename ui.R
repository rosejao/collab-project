# Declaring libraries
library(shiny)
library(ggplot2)
library(dplyr)
source("analysis.R")

# Defining UI
ui <- fluidPage(
  navbarPage(
    tabsetPanel(
      tabPanel("Food and Feed Produced by Country",
               titlePanel("Food and Feed Produced by Country"),
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
                   plotlyOutput("plot1")
                   
                 )
               )
      ),
      tabPanel("Compare Country Food and Feed Trends",
               titlePanel("Country Food and Feed Trends"),
               sidebarLayout(
                 sidebarPanel(
                   selectizeInput(
                     'country', 'Countries:', choices = countries, 
                     options = list(maxItems = 2, placeholder = "choose a country"), multiple = TRUE
                   ),
                   selectInput("element", label = h4("Choose an Element"),
                               choices = elements),
                   selectizeInput(
                     'item', 'Items:', choices = items, 
                     options = list(maxItems = 1, placeholder = "choose an item"), multiple = TRUE, 
                     selected = "Beer"
                   )
                 ),
                 mainPanel(
                   plotlyOutput("plot2")
                   
                 )
               )
               ),
      tabPanel("Top Countries per Item",
               titlePanel("Top Countries per Item"),
               sidebarLayout(
                 sidebarPanel(
                   sliderInput("year2", "Year:",
                               min = 1961, max = 2013, value = 1961, step = 1),
                   selectInput("element2", label = h4("Choose an Element"),
                               choices = elements),
                   selectizeInput(
                     'item2', 'Items:', choices = items, 
                     options = list(maxItems = 1, placeholder = "choose an item"), multiple = TRUE, 
                     selected = "Beer"
                   )
                 ),
                 mainPanel(
                   plotlyOutput("plot3")
                   
                 )
               )
      )
  )))

## App config
shinyUI(ui)
