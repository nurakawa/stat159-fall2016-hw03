.PHONY: all eda regression session tests report clean

# all	
all: eda regression report

# data downloads Advertising dataset
data: 
	cd code/data
	curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv 

# sourcing scripts for eda, regression, session info
eda: 
	cd code/scripts; Rscript -e 'source("eda-script.R")'

regression:
	cd code/scripts; Rscript -e 'source("regression-script.R")'

session :
	cd code/scripts; Rscript -e 'source("session-info-script.R")'


# test regression function
tests: 
	Rscript -e 'source("test-that.R")'


# make report
report:
	cd ../..
	cd report
	#Rscript -e "library(devtools)"
	Rscript -e "devtools::install_github('rstudio/rmarkdown')"
	RScript -e "library(rmarkdown)"
	Rscript -e "render('report.Rmd', 'pdf_document')"
	
# Clean output file
clean:
	rm -f report/report.pdf
