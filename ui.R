## Declaring libraries
library(shiny)
library(ggplot2)
library(dplyr)
source("analysis.R")

## Defining UI
ui <-   navbarPage("Global Agricultural Production", theme = "project.css",

      ## tab 1 lets users select a year and an item and displays a choropleth
      ## map showing how much each country produces
      tabPanel(
        "Food and Feed Produced by Country",
        titlePanel("Food and Feed Produced by Country"),
        sidebarLayout(
          sidebarPanel(
            sliderInput("year", "Year:",
              sep = "", min = 1961, max = 2013,
                value = 1961, step = 1, animate =
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
              strong("What We Produce and How It Has Changed"),
              align = "center"
            ),
            p(
              strong("Instructions:"), "Select either ‘Food’ or ‘Feed’ and then
choose the agricultural item that will be measured by global production. Use the
slider to select the year and hover over the desired country on the interactive
map for the number of tons produced in that specific country."
            ),

            p(
              em("For this example, we will use ‘Maize and products’
and focus on the United States.")
            ),
            p("In 1961 the U.S. produced 81.5 million tons for feed
and 1.47 million tons for food, and in 2013 128 million tons were produced
for feed and 3.91 million tons for food. Although the tons of feed and
food increased over half a century, the amounts actually decreased
              in comparison to the global production."),

            p("We see that the U.S. grew from 183.7
million to 316 million people (US Census). When we take
population into account, we see that the U.S. reduced the maize
production per person and produced 1.2 tons and 0.81 tons
of maize per American in 1961 and 2013 respectively.
The majority of maize production is being utilized for animal feed.
This is most likely attributed to the drastic increase in meat
production and consumption by American consumers. The graph below shows the
increase in meat consumption spearheaded by the popular rise in poultry over
the past couple of decades."),

            img(src = "annual-meat-consumption.png", height = 372, width = 672),



            p("It appears that the U.S. maintains a pretty
high production of feed relative
to the global production levels but begins to
lose market share in the 2000s."),

            p("For further analysis, we can use the
‘Compare Country Food and Feed Trends’ to
segment a particular product or compare/contrast countries.
You may also use the ‘Top Countries per Item’ tab to get general
oversight of the top producing countries.")
          )
        )
      ),

      ## tab 2 lets users see the trend of an item produced by two countries
      ## at the same time
      tabPanel(
        "Compare Country Food and Feed Trends",
        titlePanel("Country Food and Feed Trends"),
        sidebarLayout(
          sidebarPanel(
            selectizeInput(
              "country", "Countries",
              choices = countries,
              options = list(maxItems = 2, placeholder =
                               "Choose 1 or 2 countries"),
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
            plotlyOutput("plot2"),
            h4(
              strong("How do Countries Compare?"),
              align = "center"
            ),
            p(strong("Instructions:"), "Type in which two countries you would
like to compare/contrast. Select either ‘Food’ or ‘Feed’ and then choose the
              agricultural item that will be measured by production levels.
Use the graph to
              look at trends and hover over the lines at any given point for
              exact amounts."),
            p(em("For this example we will compare the production
of maize in the
                 U.S.A and mainland China.")),
            p("Upon a quick glance at the ‘Food’ and ‘Feed’ graphs,
we see that China
              witnessed dramatic growth in 1978 which is when the
Chinese had their
              agricultural revolution. They eliminated personal
farms and property,
              and replaced their system with a socialistic approach
by contributing to
              collective farms. We also see that the U.S. reached a
production plateau
              in 1987, and a quick Google search shows that the U.S.
overproduced corn that
              year and struggled with storing the surplus corn due to
storage limitations
              and spoilage."),
            p("Sources:"),
            p(a("https://www.nytimes.com/1987/10/11/us/corn-harvest-is-bounty-and-burden.html"),
            a("https://www.npr.org/sections/money/2012/01/20/145360447/the-secret-document-that-transformed-china"))
          )
        )
      ),
      ## tab 3 lets the user select a year, element, and country and displays a
      ## barplot with the top 5 items that are produced by that country
      ## given those filters
      tabPanel(
        "Top Countries per Item",
        titlePanel("Top Countries per Item"),
        sidebarLayout(
          sidebarPanel(
            sliderInput("year2", "Year:",
              sep = "", min = 1961, max = 2013,
              value = 1961, step = 1, animate =
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
            plotlyOutput("plot3"),
            br(""),
            h4(
              strong("Who Produces The Most?"),
              align = "center"
            ),
            br(""),
            p(strong("Instructions:"), "Select either ‘Food’ or ‘Feed’
and then choose the
              agricultural item that will be measured by production levels.
Use the graph to
              look at trends and hover over the bars for the top producers
              and their exact amounts.")
          )
        )
      ),
      ## tab 4 lets the user select a year, element, and item and displays a
      ## barplot with the top 5 countries that produce that item
      ## given those filters
      tabPanel(
        "Top Items per Country",
        titlePanel("Top Items per Country"),
        sidebarLayout(
          sidebarPanel(
            sliderInput("year3", "Year:",
              sep = "", min = 1961, max = 2013,
              value = 1961, step = 1, animate =
                animationOptions(interval = 1000, loop = TRUE)
            ),
            selectInput("element3",
              label = h4("Choose an Element"),
              choices = elements
            ),
            selectizeInput(
              "country2", "Country:",
              choices = countries,
              options = list(maxItems = 1, placeholder = "Choose a country"),
              multiple = TRUE,
              selected = "India"
            )
          ),
          mainPanel(
            plotlyOutput("plot4"),
            h4(
              strong("What Does Each Country Produce?"),
              align = "center"
            ),
            br(""),
            p(strong("Instructions:"), "Select either ‘Food’ or ‘Feed’
and then choose which
              country you would like to explore the agricultural
production. Use the graph to
              look at trends and hover over the bars of the displayed
              product for exact amounts.")
          )
        )
      )
    )

## App config
shinyUI(ui)
