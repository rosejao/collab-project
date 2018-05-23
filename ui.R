## Set up
library(shiny)
library(ggplot2)
library(dplyr)

## Ui
ui <- navbarPage(
  theme = "web.css",
  tabsetPanel(
    tabPanel(
      "Food & Feed",
      titlePanel("World Food and Feed Production Flow"),
      sidebarLayout(
        sidebarPanel(
  
        ),
        mainPanel(
          plotOutput()
        )
      )
    ),
    tabPanel(
      "Countries",
      titlePanel("Countries Production Movement"),
      sidebarLayout(
        sidebarPanel(
        ),
        mainPanel(
          plotOutput()
        )
      )
    )
  )
)

## App confiG
shinyUI(ui)
