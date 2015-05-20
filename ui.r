#UI

library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Shiny Demo: FAO Fishing Data"),

  sidebarLayout(
    sidebarPanel(
      selectInput('year','Year',choices = c(1950:2012)),
      sliderInput("n", "Top # Countries:", min = 1, max = 100, value = 20),
      selectInput('country','Country',choices = countries)),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Bar Plot",plotOutput("barPlot")),
      tabPanel("Line Chart",plotOutput("lineChart")),
      tabPanel("GoogleVis",h4("FAO Fishing Data"),htmlOutput("motionChart"))

      )
    ) 
)
)
)

