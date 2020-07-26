---
title: "CodeBook"
author: "SergioMejia"
date: "25/7/2020"
output: pdf_document
---

## Variables' description 

I made a data frame based on the UCI HAR Dataset, which contains features of different signals produced by a mobile phone's 3 axial accelerometer and gyroscope.

The signals in the experiment are: 

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The first two variables are : 

- activity: the type of the activity done while recording data. (There are 6 types of activity)
- subject: the subject doing the activity. (There are 30 different subjects that participated in the experiment)

And the variables estimated for each signal are:

- mean(): Mean value
- std(): Standard deviation

I have reshaped the dataset, so it shows the average of each signal-variable pair (columns) for each combination of type of activity and subject (rows). 
