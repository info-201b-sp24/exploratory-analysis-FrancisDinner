# Francis Dinh
# Info 201
# 5/14/2024

# Load tools

install.packages("tidyverse")
library("dplyr")
library("ggplot2")

# Summary List
summary_info <- list()

# Get data from data file

data <- read.csv("Data_breaches.csv")

# Filter columns wanted lol

data <- select(data, DataBreachCause, Name, CyberattackType, WashingtoniansAffected, IndustryType, Year, BusinessType)


# Count how many total data breaches there are
summary_info$total_breaches <- nrow(data)

# Count the different types of Cyberattacks
summary_info$unique_type_cybercrime <- length(unique(data$CyberattackType))

# Determine which cybercrime causes the most data breaches
summary_info$most_cybercrime <- select(data, CyberattackType) %>% count(CyberattackType) %>% top_n(1) %>% pull(CyberattackType)

# How many Washingtonians have been affected by the largest data breach and, on average, how many Washingtonians are affected by a single cybercrime?

summary_info$biggest_breach <- select(data, Name, CyberattackType, WashingtoniansAffected) %>% filter(WashingtoniansAffected == max(WashingtoniansAffected, na.rm = TRUE))

summary_info$average_breach <- round(mean(data$WashingtoniansAffected, na.rm = TRUE))

## Ok, So the Equifax is the largest breach (affecting 3 million Washingtonians) and the average breach affects 29000 people. 

print(summary_info)

