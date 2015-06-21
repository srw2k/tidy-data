##codebook
###Steve Wassell
###Sunday, June 21, 2015

This markdown document describes the file "HAR_dataset_extracted_stats.txt" that was created by an R script named run_analysis.R. This text file is a table with 180 rows and 68 columns, described below, which was produced by calling write.table() on a data frame that was processed from the data available at the URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This zip file includes a code book of sorts, i.e., information on the data from the entire data set, named "features_info.txt"", the contents of which are in the following box, below which I will describe the data I extracted:

```html
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
```
The data I extracted were processed from the values of mean() and std() for the first block of features listed above. Note that each of the features that has "XYZ"" as part of its names actually correspond to 3 features (one for X, one for Y, and one for Z). Therefore, this account for 33 mean() values and 33 std() values, for a total of 66 columns of data, named analogously to the original feature names. All 68 column names are as follows:

```html
"activity"
"subject"
"tBodyAcc.mean...X"
"tBodyAcc.mean...Y"
"tBodyAcc.mean...Z"
"tGravityAcc.mean...X"
"tGravityAcc.mean...Y"
"tGravityAcc.mean...Z"
"tBodyAccJerk.mean...X"
"tBodyAccJerk.mean...Y"
"tBodyAccJerk.mean...Z"
"tBodyGyro.mean...X"
"tBodyGyro.mean...Y"
"tBodyGyro.mean...Z"
"tBodyGyroJerk.mean...X"
"tBodyGyroJerk.mean...Y"
"tBodyGyroJerk.mean...Z"
"tBodyAccMag.mean.."
"tGravityAccMag.mean.."
"tBodyAccJerkMag.mean.."
"tBodyGyroMag.mean.."
"tBodyGyroJerkMag.mean.."
"fBodyAcc.mean...X"
"fBodyAcc.mean...Y"
"fBodyAcc.mean...Z"
"fBodyAccJerk.mean...X"
"fBodyAccJerk.mean...Y"
"fBodyAccJerk.mean...Z"
"fBodyGyro.mean...X"
"fBodyGyro.mean...Y"
"fBodyGyro.mean...Z"
"fBodyAccMag.mean.."
"fBodyBodyAccJerkMag.mean.."
"fBodyBodyGyroMag.mean.."
"fBodyBodyGyroJerkMag.mean.."
"tBodyAcc.std...X"
"tBodyAcc.std...Y"
"tBodyAcc.std...Z"
"tGravityAcc.std...X"
"tGravityAcc.std...Y"
"tGravityAcc.std...Z"
"tBodyAccJerk.std...X"
"tBodyAccJerk.std...Y"
"tBodyAccJerk.std...Z"
"tBodyGyro.std...X"
"tBodyGyro.std...Y"
"tBodyGyro.std...Z"
"tBodyGyroJerk.std...X"
"tBodyGyroJerk.std...Y"
"tBodyGyroJerk.std...Z"
"tBodyAccMag.std.."
"tGravityAccMag.std.."
"tBodyAccJerkMag.std.."
"tBodyGyroMag.std.."
"tBodyGyroJerkMag.std.."
"fBodyAcc.std...X"
"fBodyAcc.std...Y"
"fBodyAcc.std...Z"
"fBodyAccJerk.std...X"
"fBodyAccJerk.std...Y"
"fBodyAccJerk.std...Z"
"fBodyGyro.std...X"
"fBodyGyro.std...Y"
"fBodyGyro.std...Z"
"fBodyAccMag.std.."
"fBodyBodyAccJerkMag.std.."
"fBodyBodyGyroMag.std.."
"fBodyBodyGyroJerkMag.std.."
```

The first two columns index the human subjects (numbered 1 through 30), and their activities, of which there are 6: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIR, SITTING, STANDING, LAYING). Each of the subjects was measured with each of the activities, and this is why there are 180 rows. Finally, note that the actual values in the table are means over numerous observations for the 180 activity/subject combinations. That is, the values are means of mean() values and means of std() values.

The accompanying README.md file describes the method used to generate the table from the raw data.
