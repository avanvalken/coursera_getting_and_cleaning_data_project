# coursera_getting_and_cleaning_data_project
Peer-reviewed project for the Coursera "Getting and Cleaning Data" project

# Background
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

# Instructions
You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Description

Data was downloaded and read into R using read.table()

"features" from features.txt was used to create the variable names for both training and test sets
subject_id variable was added for both sets using subject_train.txt/subject_test.txt
labs variable was added useing associated labels files

datasets were then merged using rbind()

only columns with variable names including "mean" or "std were selected using grep()

labs were changed to appropriate activity as defined by activity_labels.txt using gsub()

rows were grouped by subject_id and activity to summarize the means of each column within the groups.
Resulting dataframe was written to "TidyDataset.txt"

Codebook was initially created using dataMaid package, then edited to include features info 

