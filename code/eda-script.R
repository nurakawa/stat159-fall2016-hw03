#========================================================================================================
# Title: eda-script.R
# Author: Nura Kawa
#
# Description:
#
# eda-script.R reads in the Advertising.csv data set, 
# and computes summary statistics, histograms for all the variables (TV, Radio, Newspaper, and Sales), 
# matrix of correlations among all variables, and scatterplot-matrix (pairwise scatterplots). 
# The summary statistics (clearly labeled) and the matrix of correlations, will be saved in a file 
# eda-output.txt. In addition to including the correlation matrix in eda-output.txt, 
# save it also in binary format correlation-matrix.RData. In turn, each exploratory chart is saved 
# in PNG format.
#========================================================================================================


# read in data
envpath <- "C:/Users/Nura/Desktop/stat159-fall2016-hw03"
setwd(envpath)
advertising <- read.csv(paste0(envpath, "/data/Advertising.csv"))[,-1] #remove additional X column

# storing advertising variables
adv_variables <- colnames(advertising)

# creating a color palette
color_palette <- colorRampPalette(c("black", "grey"))(35) 

#--------------------------------------------------------------------------------------------------------
# generating histograms


for(var in adv_variables)
{
  filename = paste0(envpath,"/images/histogram-", tolower(var), ".png")
  #print(var)
  
  png(file = filename)
  hist(advertising[,var],
       main = paste("Histogram of ", var),
       xlab = "Units",
       col = sample(color_palette, 1))
  dev.off()
  rm(filename)
  #print(paste("Saved File", filename))
}




#--------------------------------------------------------------------------------------------------------
# create eda-output.txt
sink(file=paste0(envpath,"/data/eda-output.txt"))

# compute summary statistics
cat("Summary Statistics of Advertising\n")
summary(advertising)

cat("\n\n")
# compute corelation matrix
cat("Correlation Matrix\n")
cor(advertising)
sink()

#--------------------------------------------------------------------------------------------------------
# correlation-matrix.RData
sink(file = paste0(envpath, "/data/correlation-matrix.RData"))
cat("Correlation Matrix \n")
cor(advertising)
sink()

#--------------------------------------------------------------------------------------------------------
# scatterplot matrix

png(paste0(envpath, "/images/scatterplot-matrix.png"))

pairs(~TV+Radio+Newspaper+Sales,data=advertising, 
      main="Scatterplot Matrix",
      pch = 16,
      col = sample(color_palette, 1))

dev.off() 

