source("best.R")
require(testthat)

context("Finding the best hospital within a state for a given outcome.")

describe("best", {
  it("Finds the best hospital", {
    expect_match(best("TX", "heart attack"), "CYPRESS FAIRBANKS MEDICAL CENTER")
    expect_match(best("TX", "heart failure"), "FORT DUNCAN MEDICAL CENTER")
    expect_match(best("MD", "heart attack"), "JOHNS HOPKINS HOSPITAL, THE")
    expect_match(best("MD", "pneumonia"), "GREATER BALTIMORE MEDICAL CENTER")
    expect_error(best("BB", "heart attack"), "invalid state")
    expect_error(best("NY", "hert attack"), "invalid outcome")
  })
})
