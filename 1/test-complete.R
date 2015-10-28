library("testthat")
source("complete.R")

context("Read a directory of files, and report the number of complete cases in each file")

df1 <-
  structure(list(id = c(1L), nobs = c(117L)), .Names = c("id",
                                                         "nobs"), row.names = c(NA, -1L), class = "data.frame")
df2 <-
  structure(list(id = c(2L, 4L, 8L, 10L, 12L), nobs = c(1041L,
                                                        474L, 192L, 148L, 96L)), .Names = c("id", "nobs"), row.names = c(NA,
                                                                                                                         -5L), class = "data.frame")

df3 <-
  structure(list(id = c(30L, 29L, 28L, 27L, 26L, 25L), nobs = c(
    932L, 711L, 475L, 338L, 586L, 463L)), .Names = c("id", "nobs"
    ), row.names = c(NA, -6L), class = "data.frame")

test_that("match the example output for this function", {
  expect_equal(complete("specdata",                 1 ), df1)
  expect_equal(complete("specdata", c(2, 4, 8, 10, 12)), df2)
  expect_equal(complete("specdata",             30:25 ), df3)
})
