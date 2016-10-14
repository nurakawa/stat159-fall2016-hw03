#========================================================================================================
# Title: test-that.R
# Author: Nura Kawa
#
# Description: runs tests (written in test-regression.R) on regression-functions.R
#========================================================================================================
library(testthat)
source("./code/functions/regression-functions.R")

test_file("./code/functions/regression-functions.R")
