source('complete.R')

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
##
## Return a numeric vector of correlations
## NOTE: Do not round the result!
corr <- function(directory, threshold = 0) {
  complete_cases <- complete(directory)
  interesting_files <- complete_cases[complete_cases$nobs > threshold, ]$id
  
  files <- list.files(directory, full.names = TRUE)
  cor_total <- vector(mode="numeric", length=0)
  
  for (i in interesting_files){
    file <- na.omit(read.csv(files[i]))
    cor_file <- cor(file$nitrate, file$sulfate)
    cor_total <- rbind(cor_total, cor_file)
  }
  
  cor_total
}
