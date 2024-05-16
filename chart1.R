library("dplyr")
library("ggplot2")

data <- read.csv("Data_breaches.csv")

yearly_data <- select(data, Year)
year_table <- table(yearly_data$Year)
year_count <- as.data.frame(year_table) 
colnames(year_count) <- c("Year", "Freq")

ggplot(year_count, aes(x = Year, y = Freq, group = 1)) + geom_point() + labs(x = "Year", y = "Data Breaches", title = "Data Breaches from 2016 to 2024") + geom_line(group = 1)
