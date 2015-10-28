library("testthat")
source("corr.R")

context("Calculate the correlation between sulfate and nitrate")

df4 <-
  structure(c(-0.2106, -0.04999, 0.09463, 0.1253, 0.2684, 0.7631),
            .Names = c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."),
            class = c("summaryDefault", "table"))
df5 <-
  structure(c(-0.1762, -0.03109, 0.1002, 0.1397, 0.2685, 0.7631),
            .Names = c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."),
            class = c("summaryDefault", "table"))
df6 <-
  structure(c(NA, NA, NA, NaN, NA, NA),
            .Names = c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."),
            class = c("summaryDefault", "table"))
df7 <-
  structure(c(-1, -0.05282, 0.1072, 0.1368, 0.2783, 1),
            .Names = c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.", "Max."),
            class = c("summaryDefault", "table"))

test_that("match the example output for the corr.R function", {
  x <- corr("specdata", 150)
  c <- c(-0.01895754, -0.14051254, -0.04389737, -0.06815956, -0.12350667, -0.07588814)
  h <- head(x)
  expect_equal(   h, c, tolerance=5e-08)
  expect_equal(summary(x), df4)
  
  y <- corr("specdata",  400)
  expect_equal(   head(y), c(-0.01895754, -0.04389737, -0.06815956, -0.07588814,  0.76312884, -0.15782860), tolerance=5e-08)
  expect_equal(summary(y), df5)
  
  z <- corr("specdata", 5000)
  expect_equal(summary(z), df6)
  expect_equal( length(z), 0)
  
  def <- corr("specdata")
  expect_equal(summary(def), df7)
  expect_equal( length(def), 323)
})