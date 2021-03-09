Getting and Cleaning Data Course Project

The raw data for the class project comes from the UCI Machine Learning Repository. 
This is a "collection of databases, domain theories, and data generators that are used by the machine learning community for the empirical analysis of machine learning algorithms". 

• UCI information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

• Download link to the raw data: ttps://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The data used consisted of these eight files:

activity_labels.txt -- Six labels for the six different activities during which cellphone data was harvested.
features.txt -- 561 variable names forming the columns of the data set.
subject_test.txt -- 2947 observations of human subjects individually numbered as 2,4,9,10,12,13,18,20,24
subject_train.txt -- 7352 observations of human subjects individually numbered as 1,3-8,11,14-19,24,21-23,25-30
X_test.txt -- 2974 observations of 561 variables of numeric cellphone  accelerometer measurements.  
y_test.txt -- 2974 observations of 1 variable: Namely the integers 1-6 corresponding to acitivties in activity_labels.txt
X_train.txt -- 7352 observations of 561 variables of numeric cellphone  accelerometer measurements.
y_train.txt -- 7352 observations of 1 variables: Namely the integers 1-6 corresponding to acitivties in activity_labels.txt

The R-script "run_analysis.R" does the following:

1) Merges the eight data sets to create one cohesive data set.
2) Subsets this data set by extracting the 66 measurements that consist of means and standard deviations. 
3) Uses the descriptive activity names to rename the activity labels in the data set.
4) Labels the new data set with the original descriptive variable names given in features.text.

The result of steps 1-4 is a tidy data set containing 10299 oberserations of 68 variables.

5) From these results a second tidy data set was created with the means of all variables grouped according to activity and subject_ids.

The result of step 5 is a tidy data set of 180 obs of 68 variables.

In addition to the eight files above, I also used the original README.txt and feactures.txt to help create both this file and the repository's codebook file.
