#Project Description
The project involves demonstration of data collection, data cleaning and data manipulation abilities in R using sensor data collected from wearable devices. The key ask was to:

1.	Merges the training and the test sets to create one data set.

2.	Extracts only the measurements on the mean and standard deviation for each measurement. 

3.	Uses descriptive activity names to name the activities in the data set.

4.	Appropriately labels the data set with descriptive variable names.

5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Study design and data processing

##Collection of the raw data

The raw data was collected from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The description of data to be collected was available at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Creating the tidy datafile

Following steps were followed in the tidy data file:

* Read X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train_txt, subject_test.txt from “./project” and store them in x_train,x_test, y_train, y_test, subject_train,subject_test.

* To merge training and test dataset to create one data set, combine x_train and x_test by rows using rbind function and store in x_train_test.

* Column names are allocated from feature.txt to x_train_test. Now, x_train_test has 561 columns.

* Similarly, y_train and y_test is combined by using rbind function to create y_train_test. Also, subject_train and subject_test is combined to create subject_train_test.

* Then, x_train_test, y_train_test and subject_train_test is combined column wise to merge all these data sets into one called final_merge_data and “subject” and “activity” are mapped as column names for subject_train_test and y_train_test. This step completes exercise 1 mentioned in project description i.e. to merges the training and the test sets to create one data set.

* For exercise 2 i.e. to extracts only the measurements on the mean and standard deviation for each measurement, first convert all the column names of final_merge_data to lowercase.

* Then, all rows from final_merge_data are extracted but only for those column names which have either “mean” (represented by “mean” in column name) or “standard deviation” (represented by “std” in column name) based information in column names. Also, the subject and activity column is retained. This extraction is done using grep command and stored in extracted_data. This completed exercise 2.

* For exercise 3 i.e. to use descriptive activity names to name the activities in the data set, we first convert “activity” column data type to character and then replace respective values by their descriptive activity as per activity_labels.txt sheet. The labeling is : 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS, 4 SITTING,5 STANDING,6 LAYING.

* For exercise 4 i.e. to label datasets with descriptive variable name appropriately, we use gsub() function to do following replacements:
•	Acc: accelerometer.
•	Gyro : gyroscope.
•	Std: standard deviation.
•	^t : time.
•	^f : frequency.
•	Mag : magnitude.
•	Bodybody : body.
•	Tbody : timebody.

* Finally, for exercise 6 to generate new and independent tidy data set with the average of each variable for each activity and each subject, we use dplyr package and using piping to summarize all the columns by their mean grouping by subject and activity. This ultimately results in a tidy data set with 180 rows (30 subjects * 6 activities) and 88 columns (86 columns having mean or standard deviation based column information). Store this tiday data set in summarize_data.

* Write content of summarize_data to tidydataset.txt file in the project directory

#Description of the variables in the tiny_data.txt file

No. of rows : 180 (30 subjects each having 6 activities captured).

Variables present in the data (Column Name Data Type) :

$ subject	int

$ activity	chr

$ timebodyaccelerometermean()x	num

$ timebodyaccelerometermean()y	num

$ timebodyaccelerometermean()z	num

$ timebodyaccelerometerstandarddeviation()x	num

$ timebodyaccelerometerstandarddeviation()y	num

$ timebodyaccelerometerstandarddeviation()z	num

$ timegravityaccelerometermean()x	num

$ timegravityaccelerometermean()y	num

$ timegravityaccelerometermean()z	num

$ timegravityaccelerometerstandarddeviation()x	num

$ timegravityaccelerometerstandarddeviation()y	num

$ timegravityaccelerometerstandarddeviation()z	num

$ timebodyaccelerometerjerkmean()x	num

$ timebodyaccelerometerjerkmean()y	num

$ timebodyaccelerometerjerkmean()z	num

$ timebodyaccelerometerjerkstandarddeviation()x	num

$ timebodyaccelerometerjerkstandarddeviation()y	num

$ timebodyaccelerometerjerkstandarddeviation()z	num

$ timebodygyroscopemean()x	num

$ timebodygyroscopemean()y	num

$ timebodygyroscopemean()z	num

$ timebodygyroscopestandarddeviation()x	num

$ timebodygyroscopestandarddeviation()y	num

$ timebodygyroscopestandarddeviation()z	num

$ timebodygyroscopejerkmean()x	num

$ timebodygyroscopejerkmean()y	num

$ timebodygyroscopejerkmean()z	num

$ timebodygyroscopejerkstandarddeviation()x	num

$ timebodygyroscopejerkstandarddeviation()y	num

$ timebodygyroscopejerkstandarddeviation()z	num

$ timebodyaccelerometermagnitudemean()	num

$ timebodyaccelerometermagnitudestandarddeviation()	num

$ timegravityaccelerometermagnitudemean()	num

$ timegravityaccelerometermagnitudestandarddeviation()	num

$ timebodyaccelerometerjerkmagnitudemean()	num

$ timebodyaccelerometerjerkmagnitudestandarddeviation()	num

$ timebodygyroscopemagnitudemean()	num

$ timebodygyroscopemagnitudestandarddeviation()	num

$ timebodygyroscopejerkmagnitudemean()	num

$ timebodygyroscopejerkmagnitudestandarddeviation()	num

$ frequencybodyaccelerometermean()x	num

$ frequencybodyaccelerometermean()y	num

$ frequencybodyaccelerometermean()z	num

$ frequencybodyaccelerometerstandarddeviation()x	num

$ frequencybodyaccelerometerstandarddeviation()y	num

$ frequencybodyaccelerometerstandarddeviation()z	num

$ frequencybodyaccelerometermeanfreq()x	num

$ frequencybodyaccelerometermeanfreq()y	num

$ frequencybodyaccelerometermeanfreq()z	num

$ frequencybodyaccelerometerjerkmean()x	num

$ frequencybodyaccelerometerjerkmean()y	num

$ frequencybodyaccelerometerjerkmean()z	num

$ frequencybodyaccelerometerjerkstandarddeviation()x	num

$ frequencybodyaccelerometerjerkstandarddeviation()y	num

$ frequencybodyaccelerometerjerkstandarddeviation()z	num

$ frequencybodyaccelerometerjerkmeanfreq()x	num

$ frequencybodyaccelerometerjerkmeanfreq()y	num

$ frequencybodyaccelerometerjerkmeanfreq()z	num

$ frequencybodygyroscopemean()x	num

$ frequencybodygyroscopemean()y	num

$ frequencybodygyroscopemean()z	num

$ frequencybodygyroscopestandarddeviation()x	num

$ frequencybodygyroscopestandarddeviation()y	num

$ frequencybodygyroscopestandarddeviation()z	num

$ frequencybodygyroscopemeanfreq()x	num

$ frequencybodygyroscopemeanfreq()y	num

$ frequencybodygyroscopemeanfreq()z	num

$ frequencybodyaccelerometermagnitudemean()	num

$ frequencybodyaccelerometermagnitudestandarddeviation()	num

$ frequencybodyaccelerometermagnitudemeanfreq()	num

$ frequencybodyaccelerometerjerkmagnitudemean()	num

$ frequencybodyaccelerometerjerkmagnitudestandarddeviation()	num

$ frequencybodyaccelerometerjerkmagnitudemeanfreq()	num

$ frequencybodygyroscopemagnitudemean()	num

$ frequencybodygyroscopemagnitudestandarddeviation()	num

$ frequencybodygyroscopemagnitudemeanfreq()	num

$ frequencybodygyroscopejerkmagnitudemean()	num

$ frequencybodygyroscopejerkmagnitudestandarddeviation()	num

$ frequencybodygyroscopejerkmagnitudemeanfreq()	num

$ angle(timebodyaccelerometermean,gravity)	num

$ angle(timebodyaccelerometerjerkmean),gravitymean)	num

$ angle(timebodygyroscopemean,gravitymean)	num

$ angle(timebodygyroscopejerkmean,gravitymean)	num

$ angle(x,gravitymean)	num

$ angle(y,gravitymean)	num

$ angle(z,gravitymean)	num
