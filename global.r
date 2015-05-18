# global

data <- read.csv('acid.csv')%>%
          filter(sp_type=='eez')
data$Region <- as.factor(data$wrld_rgn)
