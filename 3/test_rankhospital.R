source("rankhospital.R")
require(testthat)

context("Ranking hospitals by outcome in a state.")

describe("ranking", {
  it("Ranks hospitals correctly by outcome in a state.", {
    expect_match(rankhospital("TX", "heart failure", 3), "CYPRESS FAIRBANKS MEDICAL CENTER")
    expect_match(rankhospital("TX", "heart failure", 4), "DETAR HOSPITAL NAVARRO")
    expect_match(rankhospital("MD", "heart attack", "worst"), "HARFORD MEMORIAL HOSPITAL")
    expect_true(is.na(rankhospital("MN", "heart attack", 5000)))
  })
})
