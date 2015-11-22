# 1. Download the data into ~/Downloads directory and unzip it
# 2. Switch to the data directory
#
# !!!! Please set the working directory to the unzipped data directory with setwd() below !!!!
# !!!! if you run this script from other location than the data directory itself.
# !!!! All the code below assumes that the files are available in the current directory   !!!!
#
# setwd("~/Downloads/UCI HAR Dataset")

# 3. Load all necessary libraries
library(dplyr)
library(stringr)

# 4. Clean data
#
# This function loads all the necessary data, selects appropriate columns and 
# merges the data together into one data table.
#
cleanData <- function(){
  # Load the data into R
  trainData  <- read.table("./train/X_train.txt")          #  7352 x 561
  trainLabels <- read.table("./train/y_train.txt")         #  7352 x   1
  trainSubjects <- read.table("./train/subject_train.txt") #  7352 x   1
  testData   <- read.table("./test/X_test.txt")            #  2947 x 561
  testLabels  <- read.table("./test/y_test.txt")           #  2947 x   1
  testSubjects <- read.table("./test/subject_test.txt")    #  2947 x   1
  
  
  # Load features to find out columns for std and mean
  meanStdFeatures <- getMeanAndStdFeatures()
  
  # Select mean and std columns from train and test datasets
  trainDataMeanStd <- select(trainData, meanStdFeatures$V1) # 7352 x 66
  testDataMeanStd <- select(testData, meanStdFeatures$V1)   # 2947 x 66
  
  # add activity labels
  activityLabelColName <- "ActivityName"
  subjectColName <- "Subject"
  
  # change the name of the columns for single column data sets
  colnames(trainLabels) <- c(activityLabelColName)
  colnames(trainSubjects) <- c(subjectColName)
  colnames(testLabels) <- c(activityLabelColName)
  colnames(testSubjects) <- c(subjectColName)
  
  # merge by column
  trainDataMeanStd <- cbind(trainSubjects, trainDataMeanStd)
  trainDataMeanStd <- cbind(trainLabels, trainDataMeanStd)
  testDataMeanStd <- cbind(testSubjects, testDataMeanStd)
  testDataMeanStd <- cbind(testLabels, testDataMeanStd)
  
  
  # merge by row
  data <- rbind(trainDataMeanStd, testDataMeanStd)
  data
}

#
# This function changes the numbers in labels dataset into appropriate 
# activity names found in 'activity_labels.txt' file
#
nameActivities <- function(data){
  activities <- read.table("./activity_labels.txt")
  ActivityName <- sapply(data$ActivityName, function(x) activities[x,2])
  data <- cbind(ActivityName, data[,2:ncol(data)]) 
  data
}

#
# This function selects only the variables containing mean or std in their name
# Those are used later to change the names of the columns to more descriptive names 
# and to use only mean and standard deviation columns in the final dataset
#
getMeanAndStdFeatures <- function(){
  features <- read.table("./features.txt")
  meanStdFeatures <- filter(features, grepl("mean\\(\\)|std\\(\\)",V2))
}

#
# This function creates more descriptive variable names using the 
# getMeanAndStdFeatures data
#
nameVariables <- function(data){
  meanStdFeatures <- getMeanAndStdFeatures()
  # Convert the name to more human readable form
  nameFunc <- function(rownum){
    str <- as.character(meanStdFeatures[rownum,2])
    str_replace_all(str, "^t|\\(\\)", "")
  }
  namesdt <- sapply(3:length(names(data)), function(x) nameFunc(x-2))
  namesdt <- c(names(data)[1:2], namesdt)
  colnames(data) <- namesdt
  data
}

# average of each variable for each activity and each subject
averageForEachActivityAndEachSubject <- function(data){
  dt <- data %>% group_by(ActivityName, Subject) %>% summarise_each(funs(mean))
  dt
}

#
# Utility function to save the data into a file
#
saveDF <- function(data, filename){
  write.table(data, filename, row.name=FALSE)
}

# 
# Executes all logic together (used at the end of the whole sript to run all functions together)
#
run <- function(){
  # merge the train and test data together and extracts only the mean and stddev features
  data1 <- cleanData()
  # name the activities transforming numbers to proper activity names in ActivityName column
  data1 <- nameActivities(data1)
  # name the rest of the columns using human readable forms
  data1 <- nameVariables(data1)
  # save the resulting data set
  saveDF(data1, "tidy_data_set_all.txt")
  # create the data set with averages grouped by activity and subject
  data2 <- averageForEachActivityAndEachSubject(data1)
  saveDF(data2, "tidy_data_set.txt")
}

# execute whole script below
run()