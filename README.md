# Coursera : Getting and Cleaning Data Course Project
This purpose of this document is to explain how all of the scripts work and how they are connected which has been explained in below steps:
1. Create a new project using R studio in a specific directory/folder
2. Download the data from gievn source which is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip this data and bring *.txt files present in "train" and "test" subfolders to R project folder. These files are X_train.txt,X_test.txt, y_train.txt,y_test.txt,subject_train.txt and subjecxt_test.txt.
3. Also, bring "features.txt" and features_info.txt" to R project folder
4. Ensure that all these *.txt files are in your project directory along with run_analysis.R script
5. Use source("run_analysis.R") to generate new and independent tidy data set mentioned in project exercise step 5.Once source("run_analysis.R") is executed, in the project directory, a new file, "tidydataset.txt" would be created which has independent tidy data with the average of each variable (mean and standard deviation based) for each activity and each subject. This contains 180 rows (30 subjects with 6 activities each) and 88 columns (1 for subject, one for activity and 86 columns for mean and standard deviation based columns)
6. Use read.table("tidydataset.txt") to read the content of this file.
