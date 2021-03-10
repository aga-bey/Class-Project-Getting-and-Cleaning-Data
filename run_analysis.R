# run_analysis.R 

# Steps 1-4 merge together UCI dataframes that were once whole
# The result is a tidy data frame called "all_data".
# NOTE : all_data --> 10299 obs of 68 variables

# Step 5 creates "my_tidy" a tidy data frame of means grouped by
# subject_id and activity 
# NOTE : my_tidy --> 180 obs of 68 variables


###############   STEP 1  #####################  
##### Merge training and test data sets into one data set.

# Load this package
library(dplyr)

# Read in URLS:
train_url <- "./UCI HAR Dataset/train/X_train.txt"
y_train_url <- "./UCI HAR Dataset/train/y_train.txt"
subject_train_url <- "./UCI HAR Dataset/train/subject_train.txt"
test_url <- "./UCI HAR Dataset/test/X_test.txt"
y_test_url <- "./UCI HAR Dataset/test/y_test.txt"
subject_test_url <-"./UCI HAR Dataset/test/subject_test.txt"

# Read date into data frames:
train <- read.table(train_url)
y_train <- read.table(y_train_url, col.names = ("activity"))
subject_train <- read.table(subject_train_url, col.names = ("subject_Id"))
test <- read.table(test_url)
y_test <- read.table(y_test_url, col.names = ("activity"))
subject_test <- read.table(subject_test_url, col.names = ("subject_Id"))

# Add training/subject columns to far left of train and test:
train <- cbind(subject_train, y_train, train)
test <- cbind(subject_test, y_test, test)

# Merge test and train data frames:
all_data <- merge(train,test, all = TRUE)

# Clear memory of unneeded dataframes:
rm(list = c("train","test", "y_train", "y_test", "subject_train", "subject_test"))

###############   STEP 2  ##################### 
##### Extract the measurements on the mean/std deviation.

# Read in features.txt containing column names:
features_url <- "./UCI HAR Dataset/features.txt"
all_col_names <- read.table(features_url, col.names = c("rows","features"))

#Make atomic vector containing just column names:
all_col_names <- all_col_names$features

# Get vector indexes of all names with mean() or std():
a <- (grep(("mean()"), all_col_names, fixed = TRUE))
b <- (grep(("std()"), all_col_names, fixed = TRUE))

# Combine these locations into a vector and sort: 
column_locations <- sort(c(a,b))

# Because we must keep all_data's first two columns (subject,activity)
# Add 2 to all column locations:
new_column_locations <- column_locations + 2
# And then add locations for subject/activity columns:
new_column_locations <- c(1,2, new_column_locations)

# Trim dataframe to just the columns we want:
all_data <- select(all_data, all_of(new_column_locations))
# NOTE : all_data --> 10299 obs of 68 variables

# Delete no longer needed dataframes:
rm(list = c("a","b"))

###############   STEP 3  ##################### 
##### Use descriptive activity names to name the activities in the data set

# Replace second column's 1:6 integers with descriptive factors names:
# 1 <- walking
# 2 <- walking_upstairs
# 3 <- walking_downstairs
# 4 <- sitting
# 5 <- standing
# 6 <- laying

activities_url <- "./UCI HAR Dataset/activity_labels.txt"
activities <- read.table(activities_url)
activities <- tolower(activities$V2)

# Change 2nd column to descriptive factors:
all_data$activity <- factor(all_data$activity, levels=1:6, labels = activities)


###############   STEP 4  ##################### 
##### Appropriately label the data with descriptive variable names. 

# Columns 1 and 2 are descriptive.
# But the next 66 columns are labeled with V's

# Trim all_col_names to just names we want: mean() or std()
my_col_names <- c("subject_Id", "activity", all_col_names[column_locations])

# Rename
names(all_data) <- my_col_names

###############   STEP 5  ##################### 
##### Create a independent tidy data set with the average
# of each variable for each activity and each subject.

my_tidy <- all_data %>% group_by(activity, subject_Id) %>% summarise_all(mean)
# NOTE : my_tidy --> 180 obs of 68 variables



###############   Peer Review  ##################### 
# Code used to submit "my_tidy" into Coursera for peer review:
#write.table( my_tidy, "my_tidy", row.name=FALSE) 
# Code used to check that "my_tidy" was written correctly:
# test <- read.table( "my_tidy" , header = TRUE) 
