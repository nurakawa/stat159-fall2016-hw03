#========================================================================================================
# Title: regression-functions.R
# Author: Nura Kawa
#
# Description: this script has functions that calculate regression coefficients from a lm() object:
#
# RSS : residual_sum_squares()
# TSS: total_sum_squares()
# RSE: residual_std_error()
# R^2: r_squared()
# F-Stat: f_statistic()
#
#========================================================================================================

#envpath <- "C:/Users/Nura/Desktop/stat159-fall2016-hw03/code/functions/"
#setwd(envpath)

source("../scripts/regression-script.R")

# lm() and summary() objects
reg <- lm(Sales~., data = advertising)
regsum <- summary(reg)

#--------------------------------------------------------------------------------------------------------
# RSS

residual_sum_squares <- function(lm_object)
{
  # this function takes in an lm() object and outputs the RSS.
  
  res <- lm_object$model[,1] - lm_object$fitted.values
  sum(res^2)
}

#residual_sum_squares(reg)

#--------------------------------------------------------------------------------------------------------
# TSS

total_sum_squares <- function(lm_object)
{
  # this function takes in an lm() object and outputs the TSS

  sales_mean <- mean(lm_object$model[,1])
  sales_vals <- lm_object$model[,1]
  sum((sales_vals-sales_mean)^2)
}

#total_sum_squares(reg)

#--------------------------------------------------------------------------------------------------------
# RSE

residual_std_error <- function(lm_object)
{
  # this function takes in an lm() object and outputs the RSE
  n = length(lm_object$residuals)
  RSS = residual_sum_squares(lm_object)
  sqrt((1/(n-2))*RSS)
}

#residual_std_error(reg)

#--------------------------------------------------------------------------------------------------------
# R^2

r_squared <- function(lm_object)
{
  # this function takes in an lm() object and outputs the R^2
  TSS = total_sum_squares(lm_object)
  RSS = residual_sum_squares(lm_object)
  (TSS-RSS)/TSS
}

#r_squared(reg)


#--------------------------------------------------------------------------------------------------------
# F-Stat

f_statistic <- function(lm_object)
{
  # this function takes in an lm() object and outputs the F-statistic
  p = ncol(lm_object$model)-1 #number of predictors
  n = nrow(lm_object$model)
  RSS = residual_sum_squares(lm_object)
  TSS = total_sum_squares(lm_object)
  numerator <- (TSS-RSS)/p
  denominator <- RSS/(n-p-1)
  numerator/denominator
}
