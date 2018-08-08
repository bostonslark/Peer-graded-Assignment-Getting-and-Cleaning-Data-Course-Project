# Introduction
This code book provides explanation for variables involved in the R script.

# Raw Variables
feature: A data set that contains information about body activity features.
activity: A data set that contains information about body activity labels.
test_subject: A part of test data with one column.
test_x: A part of test data with multiple columns.
test_y: A part of test data with multiple columns.
train_subject: A part of train data with one column.
train_x: A part of train data with multiple columns.
train_y: A part of train data with multiple columns.

# Processed Variables
test_y_label: A joined test data frame created for further combination.
test_tidy: The complete test data composed of test subject, x and y values.
train_y_label: A joined train data frame created for further combination.
train_tidy: The complete train data composed of test subject, x and y values.
tidy_all: The complete tidy data combined with the complete tidy test and train data.
tidy_sub: A subset of the complete tidy data with columns containing means and standard deviations.
tidy: The final tidy data set with the average of each variable for each activity and each subject.
