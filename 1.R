install.packages("tidyverse")

library(tidyverse)

data<-read.csv("Sales_Product_Details.csv")

head(data,2)
x<-data$Region
y<-data$Sales_Revenue

plot(y ~ x
     ,main="Sales Product Details:Sales Revenue vs Product category"
     ,xlab = "Region"
     ,ylab = "Sales_Revenue"
     ,pch=19
     ,frame=T
     )