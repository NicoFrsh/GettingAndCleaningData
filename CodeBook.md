# Code Book (based on [the original codebook](https://github.com/NicoFrsh/GettingAndCleaningData/blob/master/UCI%20HAR%20Dataset/features_info.txt))

A total of 30 subjects where tested doing different activities. In the raw data the results were distributed into two groups (Training and Testing group) containing three tables each:
* X_\<group\>:
  * measuring values provided by the Smartphone (detailed description below)
* subject_\<group\>:
  * to the X_\<group\>-table corresponding subject ID
* y_\<group\>:
  * to the X_\<group\>-table corresponding activity key
 
To get a tidy data set the tables were merged by adding the subject ID and activity key columnwise to the beginning of the X_\<group\> tables for each group and finally binding the two resulting tables rowwise so that the result is **one** table containing the subject ID, the activity key and the measurements for both the training and the testing group. 

To make the data set more handy the activity keys were transformed into factors according to the [original data raw documentation](https://github.com/NicoFrsh/GettingAndCleaningData/blob/master/UCI%20HAR%20Dataset/activity_labels.txt) which are more descriptive than the key values. Hence, the first two variables of the data set are:

* subject (numeric): 
  * range of 1 to 30, each number representing one subject.
* activity (factor): 
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

To reduce the amount of measurement variables only the measurements for the mean and standard deviation for each measurement were considered in the final data set. 

Note that in the original raw data there were multiple observations for each subject and each activity, which were summarized by taking their average value for each variable.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
