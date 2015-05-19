#UI

library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Ocean Acidification Shiny Demo"),

  sidebarLayout(
    sidebarPanel(
      selectInput('dataset',"Choose a dataset:",
                 choices=c('acid','uv','sst')))
    ,
  
  mainPanel(
    tabsetPanel(
      tabPanel("Histogram",plotOutput("histPlot")),
      tabPanel("Line Chart",plotOutput("lineChart")),
      tabPanel("GoogleVis",h4("Ocean Acidification OHI Scores"),htmlOutput("motionChart"))

      )
    ) 
)
)
)
