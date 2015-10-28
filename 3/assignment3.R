library(testthat)

## 1. Plot the 30-day mortality rates for heart attack
outcome <- read.csv(file.path("data", "outcome-of-care-measures.csv"), colClasses = "character")
head(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])  

## 2. Finding the best hospital in a state
source("best.R")

## 3. Ranking hospitals by outcome in a state
source("rankhospital.R")

# 4. Ranking hospitals in all states
source("rankall.R")

# 5. Submit
source('rprog_scripts_submitscript3.R')
