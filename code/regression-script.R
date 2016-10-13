#========================================================================================================
# Title: regression-script.R
# Author: Nura Kawa
#
# Description:
#
# regression-script.R reads in the Advertising.csv data set, 
# and computes a "regression" object---via lm()---as well as 
# the summary of such regression object---via summary(). 
# These objects are saved in the file regression.RData. This script also produces 
# the three diagnostics plots residual-plot.png, scale-location-plot.png, and normal-qq-plot.png 
# (see help(plot.lm) for more info).
#========================================================================================================

# read in data
envpath <- "C:/Users/Nura/Desktop/stat159-fall2016-hw03"
setwd(envpath)
advertising <- read.csv(paste0(envpath, "/data/Advertising.csv"))[,-1] #remove additional X column

#--------------------------------------------------------------------------------------------------------
# regression.RData

sink(file = paste0(envpath, "/data/regression.RData"))

# compute regression object
cat("Regression Object\n")
regression_object <- lm(Sales~TV+Radio+Newspaper, data=advertising)
regression_object

cat("/n/n")
cat("Summary of Regression Object/n")
# summary of regression object
regression_summary <- summary(regression_object)
regression_summary

sink()

#--------------------------------------------------------------------------------------------------------
# diagnositics plots

# residual-plot.png
png(paste0(envpath, "/images/residual-plot.png"))
# plot(regression_object$residuals,
#      main = "Residual Plot",
#      xlab = "residuals",
#      ylab = "",
#      pch = 16,
#      col = "magenta")
# abline(h=0)
plot(regression_object, which = 1)
dev.off()

#normal-qq-plot.png
png(paste0(envpath, "/images/normal-qq-plot.png"))
plot(regression_object, which = 2)
dev.off()

#scale-location-plot.png
png(paste0(envpath, "/images/scale-location-plot.png"))
plot(regression_object, which = 3)
dev.off()
