# Project Getting and Cleaning Data

# get column names from features.txt file
names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
names$V2 <- as.character(names$V2)

# load training data naming the columns directly
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", col.names = names$V2)

# load subject and activity tables
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)


# load test data naming the columns directly
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", col.names = names$V2)
rm(names)

# load subject and activiy tables
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# what exactly are the subject and y tables?
unique(subject_test$V1)
length(unique(subject_test$V1))

unique(subject_train$V1)
length(unique(subject_train$V1))
# as there are 9 different subject_test object it seems those are the IDs 
# of the 9 (30% of 30) test persons and 21 train persons
unique(y_test$V1)
unique(y_train$V1)
# the numbers represent the 6 different activities: WALKING, etc

# rename subject and y table columns
names(subject_train) <- "subject"; names(subject_test) <- "subject"
names(y_test) <- "activity"; names(y_train) <- "activity"

# name activities according to activity_labels.txt
library(plyr)
y_train$activity <- factor(y_train$activity)
y_train$activity <- revalue(y_train$activity, c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS",
                            "4"="SITTING","5"="STANDING","6"="LAYING"))

y_test$activity <- factor(y_test$activity)
y_test$activity <- revalue(y_test$activity, c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS",
                                                "4"="SITTING","5"="STANDING","6"="LAYING"))
# merge all tables 
# first add subject id and activity factor to X_train and X_test (columnwise)
mergedTrain <- cbind(subject_train, y_train, X_train)
mergedTest <- cbind(subject_test, y_test, X_test)

# now merge both tables to one (rowwise)
mergedData <- rbind(mergedTrain, mergedTest)
rm(mergedTrain, mergedTest)

# filter only mean and std variables
regEx <- "min\\.+|std\\.+"
meanstdcolumns <- grep(regEx, names(mergedData), value = TRUE)
meanstdcolumns <- c("subject","activity",meanstdcolumns)

meanstddata <- mergedData[meanstdcolumns]

# Create tidy data set with the average of each variable for each activity and each subject
library(dplyr)
tidydf <- tbl_df(meanstddata)
tidydf <- tidydf %>% group_by(subject, activity) %>%
        summarise_all(mean)
