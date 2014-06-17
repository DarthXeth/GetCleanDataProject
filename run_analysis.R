## This file reads data from a pre-defined directory (set in variable dataPath),
## merges the training and test datasets within the directory into one data set,
## extracts ONLY the mean and standard deviation for each measurement,
## creates descriptive, useful names, labels the extracted data accordingly, 
## and then writes this to a file named tidydata.txt for sharing and analysis

# read in our wealth of files

print("Reading in data files...")
train.x <- read.table("./UCI_HAR_Data/train/X_train.txt")
test.x <- read.table("./UCI_HAR_Data/test/X_test.txt")
train.y <- read.table("./UCI_HAR_Data/train/y_train.txt")
test.y <- read.table("./UCI_HAR_Data/test/y_test.txt")
train.subject <- read.table("./UCI_HAR_Data/train/subject_train.txt")
test.subject <- read.table("./UCI_HAR_Data/test/subject_test.txt")
activityLabels <- read.table("./UCI_HAR_Data/activity_labels.txt")
features <- read.table("./UCI_HAR_Data/features.txt")

print("Files loaded, merging data sets...")
# merge training and test datasets into one
merged.x <- rbind(train.x, test.x)
merged.y <- rbind(train.y, test.y)
merged.subject <- rbind(train.subject, test.subject)

print("Data merged, extracting columns...")
# set the column names of the merged data set to be the names from the features dataset
colnames(merged.x) <- c(as.character(features[, 2]))

# Now look in our columns and only keep those with names that match 'mean()' or 'std()'
mean <- grep("mean()", colnames(merged.x), fixed = T)
stdDev <- grep("std()", colnames(merged.x), fixed = T)

# create our working data set by only keeping those columns we identified with grep
workingData <- merged.x[, c(mean, stdDev)]

print("Columns extracted, labeling activities...")
# name the activities in the dataset
activity <- cbind(merged.y, workingData)
colnames(activity)[1] <- "Activity"

# create appropriate labels
activityLabels[, 2]<-as.character(activityLabels[, 2])

for(i in 1:length(activity[, 1])){
  activity[i, 1]<-activityLabels[activity[i, 1], 2]
}

# Create tidy data set
print("Activities labeled, creating tidy data set...")
finalData <- cbind(merged.subject, activity)
colnames(finalData)[1] <- "Subject"
tidyData <- aggregate(finalData[, 3] ~ Subject+Activity, data = finalData, FUN = "mean")

for (i in 4:ncol(finalData)){
  tidyData[, i] <- aggregate(finalData[, i] ~ Subject+Activity, data = finalData, FUN = "mean" )[, 3]
}

colnames(tidyData)[2:ncol(tidyData)] <- colnames(activity)

print("Data tidy, writing tidy data set...")
write.table(tidyData, file = "tidydata.txt")
print("Complete")
















