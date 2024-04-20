#### Preamble ####
# Purpose: Downloads and saves the data from FRED and Statistics Canada.
# Author: Abdul Ahad Qureshi
# Date: 18 April 2024
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)


#### Download data ####

consumer_debt_data <- 
  read_csv(
    file = "~/Desktop/consumer_debt.csv"
  )
interest_rates_data <-
  read_csv(
    file =  "~/Desktop/interest_rates.csv"
  )


#### Save data ####
write_csv(consumer_debt_data, "data/raw_data/consumer_debt_data.csv") 
write_csv(interest_rates_data, "data/raw_data/interest_rates_data.csv") 



         
