# Getting and Cleaning Data
Course Project

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
Steps to work on this course project:
1. Open R/R Studio.
2. Set the working directory to any desired location.
3. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to into the working direcotry.
4. Extract the downloaded zip file into the working directory.
5. Run the run_analysis.R script.

Result:
Two files would be generated:
    1. Cleaned_Combined_data.txt  --- This file is the answer to question #4 above
    2. dataSet_with_average_of_variables.txt --- This file is the answer to question #5 above
    
Requirement: plyr

