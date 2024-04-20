#### Preamble ####
# Purpose: Model
# Author: Abdul Ahad Qureshi
# Date: 18 April 2024
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(lmtest)
library(readr)
library(modelsummary)

# Read cleaned dataset
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

# Fit linear regression model
debt_interest_model <- lm(consumer_debt ~ interest_rates, data = analysis_data)

# Check model summary
summary(debt_interest_model)
modelsummary(debt_interest_model)

# Check model assumptions: normality of residuals
shapiro.test(residuals(model))

# Check model assumptions: homoscedasticity
bptest(model)

# Check for multicollinearity
cor(analysis_data$consumer_debt, analysis_data$interest_rates)

#### Save model ####
saveRDS(
  debt_interest_model,
  file = "models/first_model.rds"
)
