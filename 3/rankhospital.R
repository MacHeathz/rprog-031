source('rankall.R')

## Write a function called rankhospital that takes three arguments: the
## 2-character abbreviated name of a state (state), an outcome (outcome),
## and the ranking of a hospital in that state for that outcome (num).
## The function reads the outcome-of-care-measures.csv file and returns
## a character vector with the name of the hospital that has the ranking
## specified by the num argument.
rankhospital <- function(state, outcome, num = "best") {
  ## Get data for all states
  all_states <- rankall(outcome, num)
  
  ## Check that state is valid and if not, throw an error
  if (!is.element(state, all_states$state)) stop("invalid state")

  ## Select the relevant row from the dataset and return the hospital name
  ## for the given state.
  as.character(all_states[which(all_states["state"] == state), ]$hospital)
}