#========================================================================================================
# Title: test-regression.R
# Author: Nura Kawa
#
# Description: tests the functions of functions/regression-functions.R
#
#========================================================================================================


library(testthat)
source("./code/functions/regression-functions.R")
load("./data/regression.RData")
#--------------------------------------------------------------------------------------------------------
# we will use for our base the mtcars dataset, and also test our regression objects: 
# regression_object and regression_summary.

# mtcars regression model to be used for tests.
test_reg <- lm(mpg~disp+hp, data = mtcars)
test_regsum <- summary(test_reg)
test_f_stat <- test_regsum$fstatistic[1]; names(test_f_stat) = NULL
reg_object_f_stat <- regression_summary$fstatistic[1]; names(reg_object_f_stat) = NULL
#--------------------------------------------------------------------------------------------------------
# RSS
context("Test RSS")
test_that("RSS is accurate ",{
  
  expect_equal(residual_sum_squares(test_reg), sum(test_reg$residuals^2))
  expect_equal(residual_sum_squares(regression_object), sum(regression_object$residuals^2))
  
})  
#--------------------------------------------------------------------------------------------------------  
# TSS  
context("Test TSS")
test_that("TSS is accuarte ",{
  
  expect_equal(total_sum_squares(test_reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_equal(total_sum_squares(regression_object), 
               sum((advertising$Sales - mean(advertising$Sales))^2))
  
})
#--------------------------------------------------------------------------------------------------------  
# RSE  
context("Test RSE")
test_that("RSE is accurate ",{
  
  
  expect_true((residual_std_error(test_reg) %in% seq(test_regsum$sigma-0.1, test_regsum$sigma+0.1)))
  
  # expect that the absolute difference between our RSE and the one computed by R is 
  # less than or equal to 0.1
  
  expect_lt(abs(residual_std_error(test_reg) - test_regsum$sigma), 0.1)
  expect_lt(abs(residual_std_error(regression_object) - regression_summary$sigma), 0.1)
})
#--------------------------------------------------------------------------------------------------------
#R^2
context("Test R^2")
test_that("R^2 is accurate" , {
  
  expect_equal(r_squared(test_reg), test_regsum$r.squared)
  expect_equal(r_squared(regression_object), 
               regression_summary$r.squared)
  
})
#--------------------------------------------------------------------------------------------------------
# F-Stat
context("Test F-Stat")
test_that("F-Stat is accurate", {
  
  expect_equal(f_statistic(test_reg), test_f_stat)
  expect_equal(f_statistic(regression_object), reg_object_f_stat)

  
})
#--------------------------------------------------------------------------------------------------------  

