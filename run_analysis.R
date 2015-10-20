library("knitr")

rm(list=ls())

# project item 1: Merges the training and the test sets to create one data set.


x_train<-read.table("X_train.txt")
x_test<-read.table("X_test.txt")
y_train<-read.table("y_train.txt")
y_test<-read.table("y_test.txt")
subject_train<-read.table("subject_train.txt")
subject_test<-read.table("subject_test.txt")

x_train_test<-rbind(x_train,x_test)
y_train_tes<-rbind(y_train,y_test)
subject_train_test<-rbind(subject_train,subject_test)

final_merge_data<-cbind(subject_train_test,y_train_tes,x_train_test)
colnames(final_merge_data)[1:2]<-c("subject","activity")


# project item 2: Extracts only the measurements on the mean and standard deviation for each measurement.
install.packages("plyr")
library("plyr")
names(final_merge_data)
colnames(final_merge_data)<-tolower(colnames(final_merge_data))
extracted_data<-final_merge_data[, grepl('subject|activity|mean|std', colnames(final_merge_data))]
names(extracted_data)


# project item 3: Uses descriptive activity names to name the activities in the data set
#1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING,
extracted_data$activity <- as.character(extracted_data$activity)
extracted_data$activity[extracted_data$activity == "1"] <- "WALKING"
extracted_data$activity[extracted_data$activity == "2"] <- "WALKING_UPSTAIRS"
extracted_data$activity[extracted_data$activity == "3"] <- "WALKING_DOWNSTAIRS"
extracted_data$activity[extracted_data$activity == "4"] <- "SITTING"
extracted_data$activity[extracted_data$activity == "5"] <- "STANDING"
extracted_data$activity[extracted_data$activity == "6"] <- "LAYING"
table(extracted_data$activity)

# project item 4: Appropriately labels the data set with descriptive variable names.
colnames(extracted_data)<-gsub("-","",names(extracted_data))
colnames(extracted_data)<-gsub("acc","accelerometer",names(extracted_data))
colnames(extracted_data)<-gsub("gyro","gyroscope",names(extracted_data))
colnames(extracted_data)<-gsub("std","standarddeviation",names(extracted_data))
colnames(extracted_data)<-gsub("^t","time",names(extracted_data))
colnames(extracted_data)<-gsub("^f","frequency",names(extracted_data))
colnames(extracted_data)<-gsub("bodybody","body",names(extracted_data))
colnames(extracted_data)<-gsub("tbody","timebody",names(extracted_data))
colnames(extracted_data)<-gsub("mag","magnitude",names(extracted_data))
colnames(extracted_data)

#project item 5: From the data set in step 4, creates a second, independent tidy data set with the average of each
#variable for each activity and each subject.
library("plyr")
library("dplyr")
library(magrittr)  # ceci n'est pas un pipe
library(ggplot2) 
extracted_data1<-extracted_data
summarize_data<-extracted_data1 %>% group_by(subject,activity) %>% summarise_each(funs(mean))
names(summarize_data)

write.table(summarize_data,file="tidydataset.txt",row.names = FALSE,sep="\t")
