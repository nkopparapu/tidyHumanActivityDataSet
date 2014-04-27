Coursera - Getting and Cleaning Data course Assignment 2 
===========

The run_analysis.R script 

The orginal raw data was sourced using the following url as specified in the assignment 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The file unzipped into the R project directory ("UCI HAR Dataset")

1.  load the activity_labels.txt and features.txt files
2.  fix the default column names for activity_labels dataset
3.  load the raw data from the files for the test subjects (subject_test.txt, X_test.tx, y_test.txt)
4.  create the combined test_dataset by adding the subject_id and activity_ids also add the column names using the names from the features.txt
5.  load the raw data from the files for training subjects
6.  create the combined training_dataset (similar to the test_dataset)
7.  now merge the training and test datasets, they both have the same columns, the rows need to be appeneded
8.  Idenitify all the columns that are either mean or sd 
9.  create tidy_dataset1 that has subject_id, activity_id,columns that are mean or sd, and add the activiy labels based on the activity id,
10. first display the tidy_dataset1 and write it as a csv file
11. create tidy_dataset2 that has average of each variable grouped by each activity then by subject id
12. display the tidy_dataset2 and write it as a csv file

tidy_dataset1.csv and tidy_dataset2.csv are available in the project directory.

