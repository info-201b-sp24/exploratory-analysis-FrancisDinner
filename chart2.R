library("dplyr")
library("ggplot2")

data <- read.csv("Data_breaches.csv")

# This analysis will explore the proportion of different types of cyber crimes in Washington. Will be a pie chart! 

summarized <- filter(data, CyberattackType != "") %>% group_by(CyberattackType) %>% summarize(count = n()) %>% mutate(percent = count / sum(count) * 100)

colors <- c("orange", "darkorange", "gold", "red", "goldenrod", "saddlebrown")

ggplot(summarized, aes(x = "", y = percent, fill = CyberattackType)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  scale_fill_manual(values = colors) +
  theme_void() +
  labs(fill = "Category") +
  guides(fill = guide_legend(title = "Types of Cybercrime")) +
  labs(title="Cyber Crimes causing Data Breaches")
