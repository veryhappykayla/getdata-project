## Tidy Data Code Book

tidy_data.txt is a cleaned-up version of the Human Activity Recognition Using Smartphones Data Set, collected from the accelerometers from the Samsung Galaxy S smartphone, which is originally from:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

... and is further described at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Our tidy data is in comma-separated value (CSV) format and was created using the run_analysis.R script, which transformed the original data in the following ways:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The final tidy data output has 180 rows (coresponding to the 180 pairs of each of the 30 subjects with the 6 recorded activities). There are 68 columns:
 
Column 1: subject ID (1-30)

Column 2: activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Columns 3 - 68: tBodyAcc-mean()-X_avg, tBodyAcc-mean()-Y_avg, tBodyAcc-mean()-Z_avg, tBodyAcc-std()-X_avg, tBodyAcc-std()-Y_avg, tBodyAcc-std()-Z_avg, tGravityAcc-mean()-X_avg, tGravityAcc-mean()-Y_avg, tGravityAcc-mean()-Z_avg, tGravityAcc-std()-X_avg, tGravityAcc-std()-Y_avg, tGravityAcc-std()-Z_avg, tBodyAccJerk-mean()-X_avg, tBodyAccJerk-mean()-Y_avg, tBodyAccJerk-mean()-Z_avg, tBodyAccJerk-std()-X_avg, tBodyAccJerk-std()-Y_avg, tBodyAccJerk-std()-Z_avg, tBodyGyro-mean()-X_avg, tBodyGyro-mean()-Y_avg, tBodyGyro-mean()-Z_avg, tBodyGyro-std()-X_avg, tBodyGyro-std()-Y_avg, tBodyGyro-std()-Z_avg, tBodyGyroJerk-mean()-X_avg, tBodyGyroJerk-mean()-Y_avg, tBodyGyroJerk-mean()-Z_avg, tBodyGyroJerk-std()-X_avg, tBodyGyroJerk-std()-Y_avg, tBodyGyroJerk-std()-Z_avg, tBodyAccMag-mean()_avg, tBodyAccMag-std()_avg, tGravityAccMag-mean()_avg, tGravityAccMag-std()_avg, tBodyAccJerkMag-mean()_avg, tBodyAccJerkMag-std()_avg, tBodyGyroMag-mean()_avg, tBodyGyroMag-std()_avg, tBodyGyroJerkMag-mean()_avg, tBodyGyroJerkMag-std()_avg, fBodyAcc-mean()-X_avg, fBodyAcc-mean()-Y_avg, fBodyAcc-mean()-Z_avg, fBodyAcc-std()-X_avg, fBodyAcc-std()-Y_avg, fBodyAcc-std()-Z_avg, fBodyAccJerk-mean()-X_avg, fBodyAccJerk-mean()-Y_avg, fBodyAccJerk-mean()-Z_avg, fBodyAccJerk-std()-X_avg, fBodyAccJerk-std()-Y_avg, fBodyAccJerk-std()-Z_avg, fBodyGyro-mean()-X_avg, fBodyGyro-mean()-Y_avg, fBodyGyro-mean()-Z_avg, fBodyGyro-std()-X_avg, fBodyGyro-std()-Y_avg, fBodyGyro-std()-Z_avg, fBodyAccMag-mean()_avg, fBodyAccMag-std()_avg, fBodyBodyAccJerkMag-mean()_avg, fBodyBodyAccJerkMag-std()_avg, fBodyBodyGyroMag-mean()_avg, fBodyBodyGyroMag-std()_avg, fBodyBodyGyroJerkMag-mean()_avg, fBodyBodyGyroJerkMag-std()_avg

The last 66 columns are averages of the original mean and standard deviation measurements, for the given subject and activity. These 66 averages are named identically as the original data's feature names, but with `_avg` appended to the end of the feature name. (For more information on the original features, see the resources linked to above.)