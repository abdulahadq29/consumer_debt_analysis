#### Preamble ####
# Purpose: Simulates the desired data
# Author: Abdul Ahad Qureshi
# Date: 18 April 2024
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


# Assuming 'cleaned_data' is your dataset after cleaning and it contains
# 'VALUE' as consumer debt and 'interest_rates' as interest rates.

set.seed(123) 
n <- nrow(cleaned_data) 
beta_0 <- 200 
beta_1 <- -5 
sigma <- 50 

# Simulate interest rates based on the range observed in dataset
sim_interest_rates <- runif(n, min(cleaned_data$interest_rates), max(cleaned_data$interest_rates))

# Simulate consumer debt based on a linear model with added random noise
sim_consumer_debt <- beta_0 + beta_1 * sim_interest_rates + rnorm(n, mean = 0, sd = sigma)

# Create a simulated dataset
simulated_data <- tibble(
  REF_DATE = cleaned_data$REF_DATE, 
  interest_rates = sim_interest_rates,
  VALUE = sim_consumer_debt
)

# Visualize the simulated relationship with a scatter plot and a regression line
ggplot(simulated_data, aes(x = interest_rates, y = VALUE)) +
  geom_point() + # Scatter plot of simulated data
  geom_smooth(method = "lm", color = "blue") + 
  labs(title = "Simulated Relationship between Debt Levels and Interest Rates",
       x = "Interest Rates",
       y = "Consumer Debt Levels") +
  theme_minimal()

head(simulated_data)


