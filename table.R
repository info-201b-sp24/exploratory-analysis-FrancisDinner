library("dplyr")
library("ggplot2")

data <- read.csv("Data_breaches.csv")

table_summ <- select(data, IndustryType, WashingtoniansAffected) %>% group_by(IndustryType) %>% summarise(Breaches = n(), Average_Affected = round(mean(WashingtoniansAffected, na.rm = TRUE)))

print(arrange(table_summ, Breaches))
