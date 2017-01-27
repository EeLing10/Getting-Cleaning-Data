# CodeBook

## Data source

The data is collected from the accelerometers from the Samsung Galaxy S smartphone.
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]


## Files required for the R script

* subject_train.txt
* subject_test.txt
* X_train.txt
* X_test.txt
* Y_train.txt
* Y_test.txt
* features.txt
* activity_labels.txt


## Key Variables

* Subject - represents each of the 30 volunteers in the experiment
* Activity - the type of activity (Walking, Walking_Upstairs
, Walking_Downstairs
, Sitting, Standing, Laying
) that was recorded
* Signals (eg.tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ...) - information captured by the accelerometers 
* mean() - mean value of the signals
* std() - Standard Deviation he signals


## Transformations

* Train and test data are merged into single dataset.
* Dataset is reduced and contains only variables: Subject, Activity, mean and standard deviation measurments
* Transform the dataset using melt function to create records for each mean and standard deviation measurements for every Subject and Activity.
* Take average of the mean and standard deviation measurements for each Subject and Activity.