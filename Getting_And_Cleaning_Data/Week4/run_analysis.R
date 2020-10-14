## Loading necessary packages
library(data.table)
library(dplyr)
library(tidyr)

## Getting data into the current directory
cwd <- getwd()
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_name <- basename(data_url)
download.file(data_url, file_name)
unzip(file_name)

## Loading activity and feature labels
activities <- fread(file = "UCI HAR Dataset/activity_labels.txt", col.names = c("Activity.Indicator", "Activity.Label"))
activities <- data.frame(activities)
features <- fread(file = "UCI HAR Dataset/features.txt", col.names = c("Feature.Indicator", "Feature.Name"))
features <- data.frame(features)
mean_std_features_indices <- unlist(lapply(features[, 2], grepl, pattern = "(mean|std)\\(\\)"))
features[, 2] <- gsub("[()]","", features[, 2])
mean_std_features <- features[mean_std_features_indices, ]

## Loading and dealing with training data
train_features <- fread(file = "UCI HAR Dataset/train/X_train.txt", col.names = features[, 2])
train_features <- data.frame(train_features)
train_activities <- fread(file = "UCI HAR Dataset/train/y_train.txt", col.names = c("Activity.Indicator"))
train_activities <- data.frame(train_activities)
train_activities <- merge(train_activities, activities, by = "Activity.Indicator")
train_subjects <- fread(file = "UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject.Indicator"))

## Loading and dealing with test data
test_features <- fread(file = "UCI HAR Dataset/test/X_test.txt", col.names = features[, 2])
test_features <- data.frame(test_features)
test_activities <- fread(file = "UCI HAR Dataset/test/y_test.txt", col.names = c("Activity.Indicator"))
test_activities <- data.frame(test_activities)
test_activities <- merge(test_activities, activities, by = "Activity.Indicator")
test_subjects <- fread(file = "UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject.Indicator"))

## Merging test and training data
all_features <- rbind(test_features, train_features)
all_activities <- rbind(test_activities, train_activities)
all_subjects <- rbind(test_subjects, train_subjects)

## STEPS 1, 3 and 4: Final merged data set with descriptive variable names and activity labels
final_set <- cbind(all_features, all_activities, all_subjects)

## STEP 2: Data set with only mean and standard deviation of each measurement 
mean_std_set <- final_set[, mean_std_features_indices]

## STEP 5: Tidy data set with average of each variable for each activity and each subject

activity_label <- all_activities[, -1]
all <- cbind(all_features, activity_label, all_subjects)
total_avg <- all %>% group_by(activity_label, Subject.Indicator) %>% summarize_each(funs(mean))
write.table(total_avg, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


