# stat159-fall2016-hw03
## title: Reproducing a Multiple Regression Analysis on Advertising Data
## author: Nura Kawa
## date completed: October 14, 2016

###description
This is a public repository containing all data and source code as submission of hw03 of RCSDS.

This project reproduces a Multiple Linear Regression analysis as shown in Section 3.2 of _Introduction to Statistical Learning_ by Hastie, Tibshirani, James, and Witten.

###reproduction
To re-create this repository, one can simply fork or download the contents of the repository and run each script using R. One can also use the Makefile to generate the report.

###Licenses
This repository is __open source__.

This repository has the __Apache 2.0__ license for code. Details of the license can be read in the LICENSE file.
Below is the Creative Commons license for media.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.


###file Structure

This project has the following file structure:  

stat159-fall2016-hw03/  
+    .gitignore  
+    README.md  
+    LICENSE  
+    Makefile  
+    session-info.txt                     # produced by session-info-script.R  
+    code/  
      + README.md  
      + test-that.R  
      + functions/  
        + regression-functions.R  
      + scripts/  
        + eda-script.R  
        + regression-script.R  
        + session-info-script.R  
      + tests/  
        + test-regression.R  
    + data/  
      + README.md  
      + Advertising.csv  
      + eda-output.txt                      # produced by eda-script.R  
      + correlation-matrix.RData            # produced by eda-script.R  
      + regression.RData                    # produced by regression-script.R  
    + images/  
        + histogram-sales.png                # produced by eda-script.R  
        + histogram-tv.png                   # produced by eda-script.R  
        + histogram-radio.png                # produced by eda-script.R  
        + histogram-newspaper.png            # produced by eda-script.R  
        + scatterplot-matrix.png             # produced by eda-script.R  
        + scatterplot-tv-sales.png           # produced by regression-script.R  
        + scatterplot-radio-sales.png        # produced by regression-script.R  
        + scatterplot-newspaper-sales.png    # produced by regression-script.R  
        + residual-plot.png                  # produced by regression-script.R  
        + scale-location-plot.png            # produced by regression-script.R  
        + normal-qq-plot.png                 # produced by regression-script.R  
    + report/  
        + report.Rmd  
        + report.pdf  




