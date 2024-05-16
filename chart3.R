library("dplyr")
library("ggplot2")

data <- read.csv("Data_breaches.csv")

## Among businesses, which types are being breached the most?
### Gonna make this a bar chart. ????????

# Get the appropiate column... and remove blanks
businesses <- select(data, BusinessType) %>% filter(BusinessType != "")

# Group the column.

businesses <- group_by(businesses, BusinessType) %>% summarise(Count = n())

# Remove other... cuz it doesnt make sense to add :P

businesses <- filter(businesses, BusinessType != "Other") 

# Select only the top 5 businesses to graph

businesses <- arrange(businesses, desc(Count)) %>% head(5)

# Plot 

ggplot(businesses, aes(x = reorder(BusinessType, desc(Count)), y = Count)) + geom_bar(stat = "identity") + labs(title = "Top 5 Most Breached Businesses", x = "Business Type", y = "Breaches")

       