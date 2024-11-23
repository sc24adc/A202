install.packages("dplyr")
library(dplyr)
Sys.which("make")
.libPaths()
update.packages()

install.packages("ggplot2")
library(ggplot2)
install.packages("C:/path/to/ggplot2_3.5.1.zip", repos = NULL, type = "win.binary")

data<-read.csv("Sales_Product_Details.csv")
head(data,2)

install.packages("magrittr")
library(magrittr)

aggregated_data <- data %>%
  dplyr::group_by(Region, Product_Category) %>%
  dplyr::summarise(Total_Revenue = sum(Sales_Revenue, na.rm = TRUE)) %>%
  dplyr::mutate(Proportion = Total_Revenue / sum(Total_Revenue))

head(aggregated_data)

contingency_table <- xtabs(Total_Revenue ~ Product_Category + Region, data = aggregated_data)
contingency_table

barplot(as.matrix(contingency_table))

chi_square_result <- chisq.test(contingency_table)
chi_square_result


install.packages("ggplot2")
library(ggplot2)

.rs.restartR()

install.packages("ggplot2")
library(ggplot2)
update.packages(ask = FALSE, checkBuilt = TRUE)install.packages("ggplot2.utils")

ggplot(aggregated_data, aes(x = Region, y = Proportion, fill = Product_Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Sales Revenue Proportions by Region and Product Category",
       x = "Region", y = "Proportion of Sales Revenue") +
  theme_minimal()
install.packages("reshape2")
library(reshape2) 
heatmap_data <- dcast(aggregated_data, Region ~ Product_Category, value.var = "Proportion", fill = 0)
heatmap_data_matrix <- as.matrix(heatmap_data[,-1])
heatmap_data_matrix
