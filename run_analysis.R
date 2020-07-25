#USE CTRL + ALT + R TO RUN THE SCRIPT, THE 'finaldataset' DATA FRAME IS THE
#TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND 
#EACH SUBJECT.       THE 'data' DATA FRAME IS THE TIDY DATA SET BEFORE RESHAPING.

# Import the training and test datasets and convert them to character vectors to manipulate strings
x_train <- read.csv('./UCI HAR Dataset/train/X_train.txt', header = FALSE)
x_train <- x_train$V1
x_test <- read.csv('./UCI HAR Dataset/test/X_test.txt', header = FALSE)
x_test <- x_test$V1

# Manipulate strings to get clean data and merge in one dataset
library(stringr)
x_train <- str_squish(x_train)
x_train <- str_split(x_train,' ', simplify = TRUE)
x_train <- data.frame(x_train)
x_train <- sapply(x_train, as.numeric)
x_test <- str_squish(x_test)
x_test <- str_split(x_test,' ', simplify = TRUE)
x_test <- data.frame(x_test)
x_test <- sapply(x_test, as.numeric)
data <- rbind(x_train, x_test)

# Import features and use it in the column names, then select the mean and std measurements
columns <- read.csv('./UCI HAR Dataset/features.txt', sep = '\n', header = FALSE)
data <- data.frame(data)
colnames(data) <- columns$V1 
library(dplyr)
data <- select(data, contains('mean')|contains('std'))

# Import activity names and manipulate it, same done to subjects
act_names <- read.csv('./UCI HAR Dataset/activity_labels.txt', sep = ' ', header = FALSE)
act_names$V2[2] <- 'UPSTAIRS'
act_names$V2[3] <- 'DOWNSTAIRS'
act_trainrows <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE)
act_testrows <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE)
act_rows <- rbind(act_trainrows, act_testrows)
names(act_rows) <- 'activity'
sub_train <- read.csv('./UCI HAR Dataset/train/subject_train.txt', header = FALSE)
sub_test <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE)
subjects <- rbind(sub_train, sub_test)
names(subjects) <- 'subject'

#full dataset with names and subjects
for(i in act_names$V1){
  act_rows$activity[act_rows==i] <- act_names$V2[i]
}
labels <- cbind(subjects, act_rows)
data <- cbind(labels, data)

#reshaped dataset to get the mean of each variable per activity and subject
finaldataset <- melt(data, id = c('activity', 'subject'))
finaldataset <- dcast(finaldataset, activity + subject ~ variable, mean)
View(finaldataset)


