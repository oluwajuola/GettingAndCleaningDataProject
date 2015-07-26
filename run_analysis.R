library(plyr)

# Requirement #1: Merge Training and Test dataset into just one DataSet.
	#Read training data
trainingData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
table(trainLabel)
trainingSubject <- read.table("./train/subject_train.txt")

    #Read test data
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./test/subject_test.txt")

	#Combine the training and test data
combinedData <- rbind(trainingData, testData)
combineLabel <- rbind(trainLabel, testLabel)
joinSubject <- rbind(trainingSubject, testSubject)



# Requirement #2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices)
combinedData <- combinedData[, meanStdIndices]
dim(combinedData)
names(combinedData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove brackets "()"
names(combinedData) <- gsub("mean", "Mean", names(combinedData)) # capitalizes M
names(combinedData) <- gsub("std", "Std", names(combinedData)) # capitalizes S
names(combinedData) <- gsub("-", "", names(combinedData)) # remove dashes "-" from the column names 



# Requirement #3: Uses descriptive activity names to name the activities in the data set
activityLabel <- read.table("./activity_labels.txt")
activityLabel[, 2] <- tolower(gsub("_", "", activityLabel[, 2])) # convert to lower case
substr(activityLabel[2, 2], 8, 8) <- toupper(substr(activityLabel[2, 2], 8, 8)) # convert to upper case
substr(activityLabel[3, 2], 8, 8) <- toupper(substr(activityLabel[3, 2], 8, 8)) # convert to upper case
activityLabel <- activityLabel[combineLabel[, 1], 2]
combineLabel[, 1] <- activityLabel
names(combineLabel) <- "activity"



# Requirement #4: Appropriately labels the data set with descriptive variable names.
names(joinSubject) <- "subject"
cleanData <- cbind(joinSubject, combineLabel, combinedData); dim(cleanData) 
write.table(cleanData, "Cleaned_Combined_data.txt") # write cleaned data to file.



# Requirement #5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
resultantData <- ddply(cleanData, .(subject, activity), function(x) colMeans(x[, 3:66])) # Find column means but exclude subject (column 1) and activity column (column 2)
write.table(resultantData, "dataSet_with_average_of_variables.txt", row.name=FALSE)
