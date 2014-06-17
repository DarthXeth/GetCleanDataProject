---
title: "run_analysis"
author: "Xeth Waxman"
date: "Tuesday, June 17, 2014"
output: html_document
---
----

Pre-requisites:
 
1) The necessary data exists in a folder within your working directory named ICI_HAR_DATA  
2) The script can write to your working directory, creating a file named tidydata.txt  

-----

Data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Assignment directions:  
  
create one R script called run_analysis.R that does the following.  
1) Merges the training and the test sets to create one data set.  
2) Extracts only the measurements on the mean and standard deviation for each measurement.  
3) Uses descriptive activity names to name the activities in the data set  
4) Appropriately labels the data set with descriptive variable names.  
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  