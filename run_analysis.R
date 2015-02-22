# run_analysis.R
# Course Project
# Coursera JHU "Getting and Cleaning Data" - February 2015
#----------------
# This script downloads data collected from the accelerometers from the Samsung
# Galaxy S smartphone and prepares from it tidy data for later analysis.
# Specifically:
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each
#     measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names. 
# 5. From the data set in step 4, create a second, independent tidy data set
#     with the average of each variable for each activity and each subject.
#----------------

# Load plyr library (for step 5 below)
library(plyr)

# Download and extract data
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_filename <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(data_filename)){
    download.file(data_url, data_filename)
}
unzip(data_filename, overwrite = FALSE)

# Load general files
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)

# Loading training data
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)

# Load test data
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)

#----------------
# 1. Merge training and test sets

subjects <- rbind(subjects_train, subjects_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

# (We will combine these data sets together into one dataset in step 3 below.)

#----------------
# 2. Extract only the measurements on the mean and standard deviation for each
#    measurement.

# Find indices of features with mean() or std() in their name
names(features) <- c("id", "name")
features_mean_std <- features[grepl(features$name, pattern=".*(mean|std)\\(\\).*", ignore.case=TRUE, fixed=FALSE), ]

# Extract only the measurements for the features with mean() or std() in their
#  name, and rename variable names to be descriptive (as defined by the feature
#  vector)
X_mean_std <- X[, features_mean_std$id]
names(X_mean_std) <- features_mean_std$name

#----------------
# 3. Use descriptive activity names to name the activities in the data set

# Rename variable names for activities and subjects
names(activity_labels) <- c("id", "name")
names(subjects) <- "subject"
names(y) <- "activity"

# Replace activity id's with names, according to the key in activity_labels
y[, "activity"] <- activity_labels[y[, "activity"], "name"]

# We now complete step 1, merging all the data sets together -- so the
#  mean() std() measurements are associated with their subject ID and activity
#  name
data <- cbind(subjects, y, X_mean_std)

#----------------
# 4. Appropriately label the data set with descriptive variable names. 

# (Completed during steps 2 and 3 above.)

#----------------
# 5. From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.

tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 3:ncol(x)]))
names(tidy_data)[3:ncol(tidy_data)] <- paste0(names(tidy_data)[3:ncol(tidy_data)], "_avg")

# Write to output
write.table(tidy_data, "tidy_data.txt", sep=",", row.names=FALSE)