#========================================================================================================
# Title: regression-script.R
# Author: Nura Kawa
#
# Description:
#
# this script reads in the Advertising.csv data set 
# and computes a "regression" object---via lm()---as well as 
# the summary of such regression object---via summary(). 
# These objects are saved in the file regression.RData. This script also produces 
# the three diagnostics plots residual-plot.png, scale-location-plot.png, and normal-qq-plot.png 
# 
#========================================================================================================

# read in data
envpath <- "C:/Users/Nura/Desktop/stat159-fall2016-hw03/code/scripts/"
setwd(envpath)

advertising <- read.csv("../../data/Advertising.csv")[,-1] #remove additional X column

#--------------------------------------------------------------------------------------------------------
# regression.RData

regression_object <- lm(Sales~TV+Radio+Newspaper, data=advertising)
regression_summary <- summary(regression_object)

save(list = ls(all = TRUE),
     file = "../../data/regression.RData")
#--------------------------------------------------------------------------------------------------------
# diagnositics plots

# residual-plot.png
png("../../images/residual-plot.png")
plot(regression_object, which = 1)
dev.off()

# normal-qq-plot.png
png("../../images/normal-qq-plot.png")
plot(regression_object, which = 2)
dev.off()

# scale-location-plot.png
#png(paste0(envpath, "/images/scale-location-plot.png"))
png("../../images/scale-location-plot.png")
plot(regression_object, which = 3)
dev.off()

#--------------------------------------------------------------------------------------------------------
# scatterplot for individual linear regressions

# we list all our individual predictors
predictors <- c("TV", "Radio", "Newspaper")

# we use each predictor to fit a linear model predicting "Sales". we also output a scatterplot:

for(predictor in predictors) #iterate through all three predictors
{
  #filename = paste0(getwd(),"/images/scatterplot-", tolower(predictor), "-sales.png")
  filename = paste0("../../images/scatterplot-", tolower(predictor), "-sales.png")
  
  png(file = filename)
  simple_lm <- lm(advertising[,"Sales"]~advertising[,predictor], data = advertising)
  plot(advertising[,predictor],
       advertising[,"Sales"],
       xlab = predictor,
       ylab = "Sales",
       main = paste0(predictor, "~Sales"))
  abline(simple_lm, col = "red")
  dev.off()
  
  rm(filename)
  
}





