##
## run_analysis.R
## this script loads all the  training and test data sets provided for the assignment
## the data was downloaded using the following url and save as unzipped in the project dir
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
##
##

#  first load the activity_labels,txt and features.txt files

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
colnames(activity_labels) = c("activity_id","activity_name")
features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

# load the raw test data sets (subject_tests.txt, X_test.txt, Y_test.txt)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")


# create combined test
test_dataset = x_test
colnames(test_dataset) = features$V2
# add the activity id, subject id columns to the data frame
test_dataset = cbind(activity_id = y_test$V1,test_dataset)
test_dataset = cbind(subject_id = subject_test$V1, test_dataset)
####
##  creating the training_dataset following similar steps as for test
####
# load the raw training data sets (subject_train.txt, X_train.txt, Y_train.txt)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")


# create combined test
train_dataset = x_train
colnames(train_dataset) = features$V2
# add the activity id, subject id columns to the data frame
train_dataset = cbind(activity_id = y_train$V1,train_dataset)
train_dataset = cbind(subject_id = subject_train$V1, train_dataset)

# now merge the training and test datasets 
# they both have the same columns, the rows need to be appeneded
combined_dataset = rbind(train_dataset,test_dataset)

mean_std_subset = combined_dataset[,grepl("id|mean|std",colnames(combined_dataset))]

tidy_dataset1 = merge(mean_std_subset, activity_labels, by.x = "activity_id", by.y = "activity_id", all.x=T)
# first display the tidy_dataset1 and write it as a csv file
view(tidy_dataset1)
write.csv(tidy_dataset1,file="tidy_dataset1.csv")

# creat tidy_dataset2 that has average of each variable grouped by each activity then by subject id
tidy_dataset2 = ddply(tidy_dataset1, .(subject_id,activity_name),numcolwise(mean))
# first display the tidy_dataset2 and write it as a csv file
view(tidy_dataset2)
write.csv(tidy_dataset2,file="tidy_dataset2.csv")
