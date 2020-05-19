# GettingAndCleaningData
In this repo I took the raw data from [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and turned it into a tidy data set by merging all the relevant tables and cleaning the resulting data. The resulting data can be used for further analysis.

This repo consists of the following files:

* the raw data used for the analysis in the UCI HAR Dataset folder
* the CodeBook.md file which explains all the variables contained in the resulting tidy data set
* the Rproj file
* the run_analysis.R script where the raw data is transformed to the tidy data
* the resulting tidydf.txt file computed by the R-Script

The commented R-Script can be executed line by line to step by step deriving the tidy data set from the raw data. At last the tidy data is written to a .txt file.
