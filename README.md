# Getting and Cleaning Data Assignment

## Files in this repo

* README.md - describes how the script works
* CodeBook.md - describes the variables, the data, and any transformations to data
* run_analysis.R - R script


## Script run_analysis.R

This script does the following:

1.Download the data source from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] into data folder and unzip.

2.Read and merges the training and the test sets to create one data set.

3.Set header names to the dataset using features.txt

4.Extracts only the measurements on the mean and standard deviation for each measurement. 

5.Uses descriptive activity names to name the activities in the data set. The activity labels are in activity_labels.txt

6.Labels the data set with descriptive variable names. 

7.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

8.Write the final tidy data into a txt file
