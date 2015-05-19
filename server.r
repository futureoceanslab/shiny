#Server



library(dplyr)
library(googleVis)
library(shiny)


acid <- read.csv('acid.csv')%>%
        filter(sp_type=='eez')

shinyServer(function(input, output) {
  
  dataInput <-reactive({
    switch(input$dataset,
                   'acid'=acid)
    
  })
  
  # output$histPlot <- renderPlot({
  
  #   histogram(ref())
  # })
  
  output$motionChart<- renderGvis({
    
    gvisMotionChart(dataInput(),idvar="rgn_name",timevar="year")

    
  })
  

      
    
  })