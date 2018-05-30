#@ Declaring libraries
library(shiny)
library(ggplot2)
library(dplyr)
source("analysis.R")

#@ Defining UI
ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "project.css")
  ),
  navbarPage(
    tabsetPanel(
      
      ## First tab of selection of produce type and country
      tabPanel(
        "Food and Feed Produced by Country",
        titlePanel("Food and Feed Produced by Country"),
        sidebarLayout(
          sidebarPanel(
            sliderInput("year", "Year:",
              sep = "", min = 1961, max = 2013, value = 1961, step = 1, animate =
                animationOptions(interval = 1000, loop = TRUE)
            ),
            selectInput("mapvar2",
              label = h4("Choose an Element"),
              choices = elements
            ),
            selectInput("mapvar3",
              label = h4("Choose an Item"),
              choices = items, selected = "Maize and products"
            )
          ),
          mainPanel(
            plotlyOutput("plot1"),
            h4(
              strong("What We Produce and How It Has Changed"), align = "center"),
            p(
            strong("Instructions:"), "Select either ‘Food’ or ‘Feed’ and then 
choose the agricultural item that will be measured by global production. Use the 
slider to select the year and hover over the desired country on the interactive 
map for the number of tons produced in that specific country."),

p(
  em("For this example, we will use ‘Maize and products’ and focus on the United 
     States.")),
p("In 1961 the U.S. produced 81.5 million tons for feed and 1.47 million tons for 
food, and in 2013 1.28 billion tons were produced for feed and 3.91 million tons 
for food. Although the tons of feed and food increased over half a century, the 
amounts actually decreased in comparison to the global production."),

p("We see that the U.S. grew from 183.7 million to 316 million people (US Census). 
When we take population into account, we see that the U.S. reduced the maize 
production per person and produced 1.2 tons and 0.81 tons of maize per American
in 1961 and 2013 respectively. The majority of maize production is being utilized 
for animal feed. This is most likely attributed to the drastic increase in meat 
production and consumption by American consumers. The graph below shows the 
increase in meat consumption spearheaded by the popular rise in poultry over 
the past couple of decades."),

img(src ="annual-meat-consumption.png", height = 372, width = 672),
 


p("It appears that the U.S. maintains a pretty high production of feed relative 
to the global production levels but begins to lose market share in the 2000s."),

p("For further analysis, we can use the ‘Compare Country Food and Feed Trends’ to 
segment a particular product or compare/contrast countries. You may also use the
‘Top Countries per Item’ tab to get general oversight of the top producing countries.
")
          )
        )
      ),
      
      ## tab two of comparing 
      tabPanel(
        "Compare Country Food and Feed Trends",
        titlePanel("Country Food and Feed Trends"),
        sidebarLayout(
          sidebarPanel(
            selectizeInput(
              "country", "Countries",
              choices = countries,
              options = list(maxItems = 2, placeholder = "Choose 1 or 2 countries"),
              multiple = TRUE
            ),
            selectInput("element",
              label = h4("Choose an Element"),
              choices = elements
            ),
            selectizeInput(
              "item", "Items",
              choices = items,
              options = list(maxItems = 1, placeholder = "choose an item"),
              multiple = TRUE,
              selected = "Beer"
            )
          ),
          mainPanel(
            plotlyOutput("plot2")
          )
        )
      ),
      tabPanel(
        "Top Countries per Item",
        titlePanel("Top Countries per Item"),
        sidebarLayout(
          sidebarPanel(
            sliderInput("year2", "Year:",
              sep = "", min = 1961, max = 2013, value = 1961, step = 1, animate =
                animationOptions(interval = 1000, loop = TRUE)
            ),
            selectInput("element2",
              label = h4("Choose an Element"),
              choices = elements
            ),
            selectizeInput(
              "item2", "Items:",
              choices = items,
              options = list(maxItems = 1, placeholder = "choose an item"),
              multiple = TRUE,
              selected = "Beer"
            )
          ),
          mainPanel(
            plotlyOutput("plot3")
          )
        )
      ),
    tabPanel(
      "Top Items per Country",
      titlePanel("Top Items per Country"),
      sidebarLayout(
        sidebarPanel(
          sliderInput("year3", "Year:",
                      sep = "", min = 1961, max = 2013, value = 1961, step = 1, animate =
                        animationOptions(interval = 1000, loop = TRUE)
          ),
          selectInput("element3",
                      label = h4("Choose an Element"),
                      choices = elements
          ),
          selectizeInput(
            "country2", "Items:",
            choices = countries,
            options = list(maxItems = 1, placeholder = "Choose a country"),
            multiple = TRUE,
            selected = "India"
          )
        ),
        mainPanel(
          plotlyOutput("plot4")
    )
  )
)
    )
  )
)

## App config
shinyUI(ui)
