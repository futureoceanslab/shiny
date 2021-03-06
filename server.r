#Server.R


#----------------------------------------
# SETUP


#libraries

  library(dplyr)
  library(googleVis)
  library(shiny)
  library(ggplot2)


#dataset


# FAO fishing dataset, aggregated catch by country and year

fao <- read.csv('fao.csv',stringsAsFactors=F)%>%
        group_by(Country,Year)%>%
        summarise(Catch=sum(Catch))

#countries = unique(fao$Country)

#----------------------------------------

#SHINY SERVER FUNCTION

shinyServer(function(input, output) {

  year <- reactive({input$year})
  
  sliderValue <- reactive({input$n})
  
#  country <- reactive({input$country})

#create barplot

barData <- reactive({
  
  d = as.data.frame(fao)%>%
       filter(Year==year())%>%
        arrange(desc(Catch))%>%
         slice(1:sliderValue())

})
    
  output$barPlot<- renderPlot({
    
    ggplot(data=barData(),aes(x=reorder(Country,-Catch),y=Catch))+geom_bar(stat='identity') + 
      xlab('Country') + theme(axis.text.x = element_text(angle=45,hjust=1))
  
   })

#  lineData <- reactive({
            
#    d = as.data.frame(fao)%>%
#          arrange(Year)%>%
#           filter(Country==country())
#})

#output$lineChart <- renderPlot({
  
#  ggplot(data=lineData(),aes(x=Year,y=Catch))+geom_line(size=1.5)
  
#})
  
#Create GoogleVis plot using google vis package

#  output$motionChart<- renderGvis({
    
    
#    gData = fao%>%
#              group_by(Country,Year)%>%
#                summarise(Catch = sum(Catch))
    
#    gvisMotionChart(gData,idvar="Country",timevar="Year")


#  })
})