#### Preamble ####
# Purpose: Tests the analysis dataset
# Author: Abdul Ahad Qureshi
# Date: 18 April 2024 
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Test data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

# Test 1: Check if 'interest_rates' is numeric
test_interest_rates_class <- class(analysis_data$interest_rates) == "numeric"
print(paste("Is 'interest_rates' numeric:", test_interest_rates_class))

# Test 2: Check if 'consumer_debt' is numeric
test_consumer_debt_class <- class(analysis_data$consumer_debt) == "numeric"
print(paste("Is 'consumer_debt' numeric:", test_consumer_debt_class))

# Test 3: Check the range of 'interest_rates'
interest_rates_range <- range(analysis_data$interest_rates)
print(paste("Range of 'interest_rates':", interest_rates_range[1], "to", interest_rates_range[2]))

# Test 4: Check the range of 'consumer_debt'
consumer_debt_range <- range(analysis_data$consumer_debt)
print(paste("Range of 'consumer_debt':", consumer_debt_range[1], "to", consumer_debt_range[2]))


