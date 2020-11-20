library(tidyverse)

# 1. Merges the training and test data to create one set
# load files
## load features
features <- read.table("features.txt")
activity_labs <- read.table("activity_labels.txt")

## load training set and labels
x_train <- read.table("train/X_train.txt")
x_train_labs <- read.table("train/y_train.txt")

## load training subject ids
subjects_train <- read.table("train/subject_train.txt")

# rename variables as features
colnames(x_train) <- features$V2
# add labs variable with training labels
x_train$labs <- x_train_labs$V1
# add subject_id variable with training subject id's
x_train$subject_id <- subjects_train$V1

## same as above for test data 
x_test <- read.table("test/X_test.txt")
x_test_labs <- read.table("test/y_test.txt")
subjects_test <- read.table("test/subject_test.txt")


colnames(x_test) <- features$V2
x_test$labs <- x_test_labs$V1
x_test$subject_id <- subjects_test$V1

# merge the datasets
combo <- rbind(x_train, x_test)


# Extract mean and std from each measurement
combo_mean_std <- combo[,c(grep("mean", colnames(combo)), grep("std", colnames(combo)))]
combo_mean_std$activity <- combo$labs
combo_mean_std$subject_id <- combo$subject_id

# Uses descriptive activity names to name the activities in the data set
combo <- combo_mean_std

combo$activity <- gsub(1, "WALKING", combo$activity)
combo$activity <- gsub(2, "WALKING_UPSTAIRS", combo$activity)
combo$activity <- gsub(3, "WALKING_DOWNSTAIRS", combo$activity)
combo$activity <- gsub(4, "SITTING", combo$activity)
combo$activity <- gsub(5, "STANDING", combo$activity)
combo$activity <- gsub(6, "LAYING", combo$activity)



# Appropriately labels the data set with descriptive variable names.


# From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity 
# and each subject.

df <- combo[,c(81,80,1:79)]

df <- df %>% 
  group_by(subject_id, activity) %>% 
  summarise(across(1:79,mean))
  




