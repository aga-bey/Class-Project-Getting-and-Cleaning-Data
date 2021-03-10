


This CodeBook has three parts:
=============================

1) The Raw Data
2) CodeBook of variables for the dataframe "all_data"
3) CodeBook of variables for the dataframe "my_tide"The Raw Data comes from 


The Raw Data
===============

The raw data for the class project comes from the UCI Machine Learning Repository. 
This is a "collection of databases, domain theories, and data generators that are
used by the machine learning community for the empirical analysis of machine learning algorithms".

• UCI information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

• Download link to the raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

NOTE: The following is a cut and paste of the UCI supplied codebook: "features_info.txt" 
Minor edits were made to make the text a bit more friendly.
Also edited out was descriptions of variables that play no role in this project:

The data comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:

fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, 
fBodyAccJerkMag,
fBodyGyroMag, 
fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ
tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ. fBodyAccMag, fBodyAccJerkMag
fBodyGyroMag, fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. 
These are used on the angle() variable:

gravityMean, tBodyAccMean, tBodyAccJerkMean, BodyGyroMean, tBodyGyroJerkMean


CodeBook of variables for the dataframe "all_data"
==================================================

Essentially the "all-data" dataframe is a culmination of Steps 1-4 of the R-script: "run_analysis.R"
These steps stitch together the various pieces of a much larger dataset that was broken into pieces.
The end result is tidy subset of the orignal large dataframe.
This subset is all 66 varaibles with "mean()" or "std()" in their names. 
No summary statistics are included.
The only change to any vector of variables involves the conversion of the intergers 1-6 into their descriptive labels. 
This is explained thouroughly in the comments of "run_analysis.R".

The complete list of variables:

subject_id -  The experiment was carried out with 30 volunteers. Values for them are are integers 1 to 30.  
activity - Each person performed six activities: walking, walking_upstairs, walking_downstairs, sitting, standing, laying.

The rest of the variables are a subset (of size 66) drawn from the raw data's 561 variables:

tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y
tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y, tGravityAcc-mean()-Z
tGravityAcc-std()-X, tGravityAcc-std()-Y, tGravityAcc-std()-Z, tBodyAccJerk-mean()-X, 
tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, tBodyAccJerk-std()-X, tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z, tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X, 
tBodyGyro-std()-Y, tBodyGyro-std()-Z, tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z, tBodyGyroJerk-std()-X, tBodyGyroJerk-std()-Y, tBodyGyroJerk-std()-Z
tBodyAccMag-mean(), tBodyAccMag-std(), tGravityAccMag-mean(), tGravityAccMag-std()
tBodyAccJerkMag-mean(), tBodyAccJerkMag-std(), tBodyGyroMag-mean(), tBodyGyroMag-std()
tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std(), fBodyAcc-mean()-X, fBodyAcc-mean()-Y
fBodyAcc-mean()-Z, fBodyAcc-std()-X, fBodyAcc-std()-Y, fBodyAcc-std()-Z, fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y, fBodyAccJerk-mean()-Z, fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z, fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z
fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z, fBodyAccMag-mean()
fBodyAccMag-std(), fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std()


CodeBook of variables for the dataframe "my_tidy"
==================================================

The result of step 5 of "run_analysis.R".
From the above data frame (all_data) a new tidy data frame called "my_tidy" was created.
"my_tidy" is 180 observations of 68 variables.
It gives a summary statistic (the mean) of columns 3-68 grouped by columns 1 and 2 (subject_id and activity).







