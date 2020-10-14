# Getting-and-Cleaning-Data-Week-4-Assignment

This is the final Week 4 assignment for the Getting and Cleaning Data course on Coursera

### Description of the Data used
The X variable has measurements of various physical quantities recorded by a smartphone. The variable Y contains Activity Indicators.

### Data files used
The following data files were used:
1. features.txt: List of all features.

2. 'activity_labels.txt: Links the class labels with their activity name.

3. train/X_train.txt: Training set.

4. train/y_train.txt: Training labels.

5. test/X_test.txt: Test set.

6. test/y_test.txt: Test labels.

7. subject_train.txt: Subject Indicators for subjects whose data is in training set.

8. subject_test.txt: Subject Indicators for subjects whose data is in test set.

### Code description
The code combined the training and test datsets into a single dataset, called 'final_set'. It then extracts the
mean and standard deviation for each measurement from 'final_set', which contains descriptive variable names and 
descriptive activity labels. From 'final_set', a second, independent tidy data set with the average of each 
variable for each activity and each subject was created. This data set is called 'total_avg'.

### Merged data set from test and training data
The dataset created from the merge of test and training data is called 'final_set' and it contains descriptive variable names
and descriptive activity names.

### Tidy data set
The tidy dataset created by this script is 'total_avg' and contains the average of each variable for each activity and each subject
along with descriptive variable names and descriptive activity labels.

### The assignment instructions are given below  

1. Merges the training and the test sets to create one data set.
Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names.
Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to use
Just download run_analysis.R and run it in R using source("run_analysis.R") 
