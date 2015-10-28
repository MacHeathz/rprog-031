source("rankall.R")
require(testthat)

context("Ranking hospitals in all states.")

describe("ranking all states", {
  it("Ranks hospitals correctly by outcome for all states.", {
    expect_match(as.character(rankall("heart attack", 20)[4, ]$hospital), "JOHN C LINCOLN DEER VALLEY HOSPITAL")
    expect_match(as.character(rankall("pneumonia", "worst")[53, ]$hospital), "PLATEAU MEDICAL CENTER")
    expect_match(as.character(rankall("heart failure")[52, ]$hospital), "AURORA ST LUKES MEDICAL CENTER")
    expect_true(is.na(rankall("heart attack", 5000)[34, ]$hospital))
  })
})
