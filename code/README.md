#/code

__test-that.R__
author: Nura Kawa
description:

functions/
	__regression-functions.R__
	author: Nura Kawa
	description: this script calculates regression coefficients from an lm() object.


scripts/
__eda-script.R__  
author: Nura Kawa
description: this script reads in the Advertising.csv data set and computes summary statistics, histograms for all the 	variables (TV, Radio, Newspaper, and Sales), matrix of correlations among all variables, and scatterplot-matrix (pairwise scatterplots). The summary statistics and the matrix of correlations are saved in a file eda-output.txt, and the correlation matrix is also saved in binary format correlation-matrix.RData. In turn, each exploratory chart is saved in PNG format.
	
__regression-script.R__  
author: Nura Kawa
description:  this script reads in the Advertising.csv data set and computes a "regression" object---via lm()---as well as the summary of such 	regression object---via summary(). These objects are saved in the file regression.RData. This script also produces the three diagnostics plots residual plot.png, scale-location-plot.png, and normal-qq-plot.png 

__session-info-script.R__
author: Nura Kawa
description: runs SessionInfo() and has library() for every index



__test-that.R__
author: Nura Kawa
description: this script runs tests (written in test-regression.R) on regression-functions.R


tests/
	__test-regresion.R__
	author: Nura Kawa 
	description: this script tests the functions of functions/regression-functions.R

