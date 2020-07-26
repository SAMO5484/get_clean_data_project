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

And the variables estimated for each signal are:

- mean(): Mean value
- std(): Standard deviation

I have reshaped the dataset, so it shows, in each row, the average of each signal-variable pair for each combination of type of activity and subject (see README for more information about type of activity and subject) 
