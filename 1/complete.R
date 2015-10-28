
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
##
## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names=TRUE)
  df <- data.frame()
  
  for (i in id) {
    contents <- read.csv(files[i])
    complete_observations <- na.omit(contents)
    df <- rbind(df, c(i, nrow(complete_observations)))
  }
  
  colnames(df) <- c("id", "nobs")
  df
}
