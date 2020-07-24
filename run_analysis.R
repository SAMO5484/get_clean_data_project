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
#read features 
#names(data)
#select
