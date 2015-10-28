# Write a function called rankall that takes two arguments: an outcome name (outcome)
# and a hospital ranking (num). The function reads the outcome-of-care-measures.csv
# file and returns a 2-column data frame containing the hospital in each state that
# has the ranking specified in num. For example the function call
# rankall("heart attack", "best") would return a data frame containing the names of
# the hospitals that are the best in their respective states for 30-day heart attack
# death rates. The function should return a value for every state (some may be NA).
# The first column in the data frame is named hospital, which contains the hospital
# name, and the second column is named state, which contains the 2-character
# abbreviation for the state name. Hospitals that do not have data on a particular
# outcome should be excluded from the set of hospitals when deciding the rankings.
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  filePath <- file.path("data", "outcome-of-care-measures.csv")
  data <- read.csv(filePath, colClasses = "character")

  ## Check that outcome and num are valid
  ## Check that outcome is valid and if so, set column variable accordingly
  column <- NULL
  if (outcome == "heart attack") {
    column <- 11
  } else if (outcome == "heart failure") {
    column <- 17
  } else if (outcome == "pneumonia") {
    column <- 23
  } else {
    stop("invalid outcome")
  }
  
  ## Cast outcome column to numeric for easier comparing and finding optimum
  data[, column] <- suppressWarnings(as.numeric(data[, column]))
  
  ## Fail fast if is.numeric(num) and format not correct
  ## hospital_rank is 1 if 'best', or 'worst', boolean decr is set to FALSE
  ## by default (ascending sorting), TRUE if 'worst'
  hospital_rank <- NULL
  decr <- FALSE
  if ( is.numeric(num) ) {
    if (num < 1) {
      return(NA)
    } else {
      hospital_rank <- num
    }
  } else if (is.character(num)) {
    if (num == "best") {
      hospital_rank <- 1
    } else if (num == "worst") {
      hospital_rank <- 1
      decr <- TRUE
    }
  } else {
    stop("invalid num")
  }
  
  ## Invariant: data and column are set to something useful
  if (is.null(column) || is.null(hospital_rank))
    stop("Got NULL value, this shouldn't happen!")
  
  ## For each state, find the hospital of the given rank
  sorted_all_states <-
    data[ order(data[, "State"],
                data[, column],
                data[, "Hospital.Name"],
                decreasing = decr, na.last = TRUE), ]
  
  states <- unique(sorted_all_states[, "State"])
  
  df <- data.frame()
  for (state in states) {
    state_list <- subset(sorted_all_states, State == state)
    row <- data.frame("hospital" = state_list[hospital_rank, ]$Hospital.Name, 
                      "state" = state)
    
    ## Result must be in increasing order for State column.
    df <- if(!decr) rbind(df, row) else rbind(row, df)
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df
}



