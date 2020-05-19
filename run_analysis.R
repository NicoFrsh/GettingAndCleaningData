# Project Getting and Cleaning Data

# get column names from features.txt file
names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
names$V2 <- as.character(names$V2)

# load train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", col.names = names$V2)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)


# load test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", col.names = names$V2)

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
# might be the 6 different activities: WALKING, etc

# rename subject and y table columns
names(subject_train) <- "id"; names(subject_test) <- "id"
names(y_test) <- "activity"; names(y_train) <- "activity"

# merge all tables based on 