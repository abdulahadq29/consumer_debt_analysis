#### Preamble ####
# Purpose: Cleans the raw data and saves it as analysis data
# Author: Abdul Ahad Qureshi
# Date: 18 April 2024 
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT

#### Workplace setup ####
library(dplyr)
library(lubridate)
library(arrow)
library(readr)

# Read the household debt dataset
consumer_debt_data <- read.csv("data/raw_data/consumer_debt_data.csv")

# Read the short-term interest rates dataset
interest_rates_data <- read.csv("data/raw_data/interest_rates_data.csv")

# Convert dates to year-month format
interest_rates_data$DATE <- as.Date(interest_rates_data$DATE, format = "%Y-%m-%d")
#interest_rates_data$DATE <- format(interest_rates_data$DATE, format = "%Y-%m")


# Convert REF_DATE to Date type
consumer_debt_data$REF_DATE <- as.Date(paste(consumer_debt_data$REF_DATE, "-01",sep = ""))

# Merge datasets by date
merged_data <- merge(consumer_debt_data, interest_rates_data, by.x = "REF_DATE", by.y = "DATE")

# Clean merged dataset (remove unnecessary columns, handle missing values, etc.)
cleaned_data <- merged_data %>%
  select(-c("GEO", "DGUID", "UOM", "UOM_ID", "SCALAR_FACTOR", "SCALAR_ID", "VECTOR", "COORDINATE", "STATUS", "SYMBOL", "TERMINATED", "DECIMALS")) %>%
  na.omit()

# Filter data for "Credit market debt to disposable income" category
cleaned_data <- cleaned_data %>%
  filter(Categories == "Credit market debt to disposable income")

# Save cleaned dataset
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

