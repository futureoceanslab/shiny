# global

data <- read.csv('acid.csv')%>%
          filter(sp_type=='eez')%>%
data$wrld_rgn <- factor(data$wrld_rgn)
