### Code Book for data set created in 'Getting and Cleaning Data' course held at Coursera.org

## Intro

The purpose of creating the dataset described below is to prove ones ability to prepare it for
further analysis, extracts only those variables which are the most important, merge the data into
one convenient data table, clean it up and make it more human-understendable.

## Dataset Description

The original dataset is the 'Human Activity Recognition Using Smartphones Data Set' available at 'http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones' and was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The resulting dataset for which this CodeBook was created merges some of the files found in the original dataset and extracts the measures only on the mean and standard deviation for each measurement found in the original data set.

Original dataset dimensions for each file before transformations (merging, filtering) where as follows:

| File Name               | Rows      | Columns  |
|-------------------------|-----------|----------|
| train/X_train.txt       |   7352    |   561    |  
| train/y_train.txt       |   7352    |     1    |   
| train/subject_train.txt |   7352    |     1    |   
| test/X_test.txt         |   2947    |   561    |
| test/y_test.txt         |   2947    |     1    |
| test/subject_test.txt   |   2947    |     1    |

## Clened-up Dataset

There are actually two datasets created along the way, first one is the cleaned up version of the original dataset and the second is the result of calculating the averages for each variable grouped by Subject and Activity Name.

#### First dataset (after cleanup)

###### Dimensions:
```
dim(data1)
[1] 10299    68
```
###### Column Names:
```
colnames(data1)
 [1] "ActivityName"              "Subject"                   "BodyAcc-mean-X"            "BodyAcc-mean-Y"            "BodyAcc-mean-Z"           
 [6] "BodyAcc-std-X"             "BodyAcc-std-Y"             "BodyAcc-std-Z"             "GravityAcc-mean-X"         "GravityAcc-mean-Y"        
[11] "GravityAcc-mean-Z"         "GravityAcc-std-X"          "GravityAcc-std-Y"          "GravityAcc-std-Z"          "BodyAccJerk-mean-X"       
[16] "BodyAccJerk-mean-Y"        "BodyAccJerk-mean-Z"        "BodyAccJerk-std-X"         "BodyAccJerk-std-Y"         "BodyAccJerk-std-Z"        
[21] "BodyGyro-mean-X"           "BodyGyro-mean-Y"           "BodyGyro-mean-Z"           "BodyGyro-std-X"            "BodyGyro-std-Y"           
[26] "BodyGyro-std-Z"            "BodyGyroJerk-mean-X"       "BodyGyroJerk-mean-Y"       "BodyGyroJerk-mean-Z"       "BodyGyroJerk-std-X"       
[31] "BodyGyroJerk-std-Y"        "BodyGyroJerk-std-Z"        "BodyAccMag-mean"           "BodyAccMag-std"            "GravityAccMag-mean"       
[36] "GravityAccMag-std"         "BodyAccJerkMag-mean"       "BodyAccJerkMag-std"        "BodyGyroMag-mean"          "BodyGyroMag-std"          
[41] "BodyGyroJerkMag-mean"      "BodyGyroJerkMag-std"       "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"           "fBodyAcc-mean-Z"          
[46] "fBodyAcc-std-X"            "fBodyAcc-std-Y"            "fBodyAcc-std-Z"            "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"      
[51] "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"        "fBodyAccJerk-std-Y"        "fBodyAccJerk-std-Z"        "fBodyGyro-mean-X"         
[56] "fBodyGyro-mean-Y"          "fBodyGyro-mean-Z"          "fBodyGyro-std-X"           "fBodyGyro-std-Y"           "fBodyGyro-std-Z"          
[61] "fBodyAccMag-mean"          "fBodyAccMag-std"           "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"   "fBodyBodyGyroMag-mean"    
[66] "fBodyBodyGyroMag-std"      "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std"
```

###### General structure:

```
str(data1)
'data.frame':	10299 obs. of  68 variables:
 $ ActivityName             : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ Subject                  : int  1 1 1 1 1 1 1 1 1 1 ...
 $ BodyAcc-mean-X           : num  0.289 0.278 0.28 0.279 0.277 ...
 $ BodyAcc-mean-Y           : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ BodyAcc-mean-Z           : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ BodyAcc-std-X            : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 .....
```

#### Second dataset (after calculating averages grouped by Subject and Activity Name)

###### Dimensions:
```
dim(data2)
[1] 180  68
```
###### Column Names:
```
colnames(data2)
 [1] "ActivityName"              "Subject"                   "BodyAcc-mean-X"            "BodyAcc-mean-Y"            "BodyAcc-mean-Z"           
 [6] "BodyAcc-std-X"             "BodyAcc-std-Y"             "BodyAcc-std-Z"             "GravityAcc-mean-X"         "GravityAcc-mean-Y"        
[11] "GravityAcc-mean-Z"         "GravityAcc-std-X"          "GravityAcc-std-Y"          "GravityAcc-std-Z"          "BodyAccJerk-mean-X"       
[16] "BodyAccJerk-mean-Y"        "BodyAccJerk-mean-Z"        "BodyAccJerk-std-X"         "BodyAccJerk-std-Y"         "BodyAccJerk-std-Z"        
[21] "BodyGyro-mean-X"           "BodyGyro-mean-Y"           "BodyGyro-mean-Z"           "BodyGyro-std-X"            "BodyGyro-std-Y"           
[26] "BodyGyro-std-Z"            "BodyGyroJerk-mean-X"       "BodyGyroJerk-mean-Y"       "BodyGyroJerk-mean-Z"       "BodyGyroJerk-std-X"       
[31] "BodyGyroJerk-std-Y"        "BodyGyroJerk-std-Z"        "BodyAccMag-mean"           "BodyAccMag-std"            "GravityAccMag-mean"       
[36] "GravityAccMag-std"         "BodyAccJerkMag-mean"       "BodyAccJerkMag-std"        "BodyGyroMag-mean"          "BodyGyroMag-std"          
[41] "BodyGyroJerkMag-mean"      "BodyGyroJerkMag-std"       "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"           "fBodyAcc-mean-Z"          
[46] "fBodyAcc-std-X"            "fBodyAcc-std-Y"            "fBodyAcc-std-Z"            "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"      
[51] "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"        "fBodyAccJerk-std-Y"        "fBodyAccJerk-std-Z"        "fBodyGyro-mean-X"         
[56] "fBodyGyro-mean-Y"          "fBodyGyro-mean-Z"          "fBodyGyro-std-X"           "fBodyGyro-std-Y"           "fBodyGyro-std-Z"          
[61] "fBodyAccMag-mean"          "fBodyAccMag-std"           "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"   "fBodyBodyGyroMag-mean"    
[66] "fBodyBodyGyroMag-std"      "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std"
```

###### General structure:

```
str(data2)
Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  68 variables:
 $ ActivityName             : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ Subject                  : int  1 2 3 4 5 6 7 8 9 10 ...
 $ BodyAcc-mean-X           : num  0.222 0.281 0.276 0.264 0.278 ...
 $ BodyAcc-mean-Y           : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
 $ BodyAcc-mean-Z           : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
 $ BodyAcc-std-X            : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
 .....
```

## Description of 'run_analysis.R' script

The script for performing all the cleaning operations were created using the number of more or less specialized functions to clean up the data step by step.
The scripts executes a number of operations described below:

1. Load all necessary libraries like 'dplyr' and 'stringr'
  * 'dplyr' is used in many places mostly to select appropriate columns or execute group by operations
  * 'stringr' is used to transform variable names into more human readable form easily

2. The data is loaded into R from multiple files and merge together, only the 'mean' and 'std' columns are selected.

3. The activities which are originally represented by numbers are transformed into factor with names found in a separate file.

4. The column names with measurements get renamed to a human readable form using the strings found in a separate file.

5. All the functions are run together (sequentially) using a wrapper function called 'run()' which is being called at the end of the script file.

6. The 'run()' function saves the the datasets described above into a files stored in the current working directory.

Please look into 'run_analysis.R' scripts for more details where each of the functions is commented.
