library(plyr)
library(dplyr)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
valid_column_names <- make.names(names=features[,2], unique=TRUE)
valid_column_names[556] <- "angle.tBodyAccJerkMean.gravityMean." #corrects typo in features.txt

subject_test <- rename(subject_test, subject = V1)
subject_train <- rename(subject_train, subject = V1)
y_test <- rename(y_test, activity = V1)
y_train <- rename(y_train, activity = V1)

colnames(X_test) <- valid_column_names
X_test <- select(X_test, contains("mean.."), contains("std.."))
colnames(X_train) <- valid_column_names
X_train <- select(X_train, contains("mean.."), contains("std.."))

testDF <- cbind(subject_test, y_test, X_test)
trainDF <- cbind(subject_train, y_train, X_train)
finalDF <- rbind(testDF, trainDF)

finalDF$activity[finalDF$activity == 1] <- "WALKING"
finalDF$activity[finalDF$activity == 2] <- "WALKING_UPSTAIRS"
finalDF$activity[finalDF$activity == 3] <- "WALKING_DOWNSTAIRS"
finalDF$activity[finalDF$activity == 4] <- "SITTING"
finalDF$activity[finalDF$activity == 5] <- "STANDING"
finalDF$activity[finalDF$activity == 6] <- "LAYING"

tidyDF <- ddply(finalDF, c("activity", "subject"), numcolwise(mean))
