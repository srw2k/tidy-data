# tidy-data
For Getting and Cleaning Data project

This README file describes the script run_analysis.R that reads several files from the UCI HAR Dataset and produces a tidy data table of 180 rows and 68 columns, according to the project directions, which I call "HAR_dataset_extracted_stats.txt".

The first two lines simply load the necessary packages.

Next the primary six data files are read from the current working directory.

In the next three lines of code (lines 11-13), I read in the "features.txt" file from the dataset, which I decided to use for the column names; I convert these names to valid R names (basically just converting the hyphens and parentheses to periods); and and I correct the result of a typo in entry 556 of features.txt, an extra right parenthesis before the comma: angle(tBodyAccJerkMean),gravityMean).

In lines 15-18 I set the column names of the X_test and X_train tables to these valid names produced above, and then I select only those columns that include mean() and std() data.

In lines 20-23 I set the column names of the subject_test and subject_train tables to "subject" and the column names of the y_test and y_train tables to "activity".

In lines 25-27 I merge the columns of the three test tables and the three train tables, and then I merge the rows of the results to produce the completely merged data frame finalDF.

In lines 29-34 I change all the activity codes of finalDF to their corresponding textual descriptions.

In line 36 I create the tidy data frame as required in the project assignment by finding the means of the data from finalDF grouped by activity and subject.

Finally I write the tidy data to "HAR_dataset_extracted_stats.txt".

The accompanying codebook.md file describes this text file itself in more detail.
