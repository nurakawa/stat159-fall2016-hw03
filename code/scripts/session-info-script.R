#========================================================================================================
# Title: session-info.R
# Author: Nura Kawa
#
# Description: tests the functions of functions/regression-functions.R
#
#========================================================================================================

# Packages used
library(stats)
library(graphics)
library(grDevices)
library(utils)
library(datasets)
library(methods)
library(base)
library(testthat)
library(xtable)
library(magrittr)
library(R6)
library(htmltools)
library(yaml)
library(crayon)
library(Rcpp)
library(rmarkdown)
library(knitr)
library(digest)

#--------------------------------------------------------------------------------------------------------
# creating session-info.txt

sink(file = "../../session-info.txt")

cat("Session Information\n")
cat("Author: Nura Kawa\n\n\n")
sessionInfo()

sink()

print("Session Info Script Complete")