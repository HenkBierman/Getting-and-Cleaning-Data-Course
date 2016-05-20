## This script creates two tidy files based on a dataset of the
## Human Activity Recognition Using Smartphones Dataset Project:
## The script merges the test- and traindata and adds the activity
## description, and writes this into a csv file
## Secondly the above csv file is summarized bij calculating the
## mean of involved colums per subject-activity combination
## Both files are printed and written as CSV files
  
  library(reshape2)
  library(dplyr)
  
## Read activity names   
  
  ActivityNames <- read.table("Activity_labels.txt")

## Read test and training data  
    
  testData <- read.table("X_test.txt", header = FALSE, sep = "")
  
  testData <- testData[1:6]
  
  trainData <- read.table("X_train.txt", header = FALSE, sep = "")
  
  trainData <- trainData[1:6]

## join test and train data into one dataframe and add appropriate heading  
    
  joinedTrainTestData <- rbind(trainData, testData, make.row.names = FALSE)
  
  names(joinedTrainTestData) <- c("tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z")

## Read test and train lables, and join them in one dataframe  
    
  testLabels <- read.table("y_test.txt", header = FALSE, sep = "")
  
  trainLabels <- read.table("y_train.txt", header = FALSE, sep = "")

  joinedLabels <- rbind(trainLabels, testLabels, make.row.names = FALSE)

## Assign activity names to the matching labels  
    
  names(ActivityNames) <- c("activity_id", "activity")
  
  names(joinedLabels) <- c("label_id")

  joinedLabels <- merge(joinedLabels, ActivityNames, by.x = "label_id", by.y = "activity_id", sort = FALSE)
 
## join test and train labels and give it a proper header name; merge this to joined test and train data
   
  testSubjects <- read.table("subject_test.txt", header = FALSE, sep = "")
  
  trainSubjects <- read.table("Subject_train.txt", header = FALSE, sep = "")
  
  joinedSubjects <- rbind(trainSubjects, testSubjects, make.row.names = FALSE)
  
  names(joinedSubjects) <- c("Subject_id")
  
  joinedTrainTestData <- merge(joinedTrainTestData, joinedLabels, by = "row.names", sort = FALSE)

## remove row.names column and add   
   
  joinedTrainTestData <- select(joinedTrainTestData, 2:9)

## add subjects to the dataframe  
     
  joinedTrainTestData <- merge(joinedTrainTestData, joinedSubjects, by = "row.names", sort = FALSE)

## destillate the first tidy dataframe out of the collection dataframe and print head
    
  TidiedTrainTestData <- select(joinedTrainTestData, 2:7, 9)
  
  head(TidiedTrainTestData)
  
## retrieve required attributes for the second tidy dataframe out of the collection dataframe  
  
  TidiedAvarageData <- select(joinedTrainTestData, 2:8, 10)
  
## create the agregated means data per subject and activity  
  
  TidiedAvarageData <- group_by(TidiedAvarageData, Subject_id, label_id)
  
  summary <- summarise(TidiedAvarageData,tBodyAcc_mean_X = mean(tBodyAcc_mean_X),
            tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
            tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
            tBodyAcc_std_X = mean(tBodyAcc_std_X),
            tBodyAcc_std_Y = mean(tBodyAcc_std_Y),
            tBodyAcc_std_Z = mean(tBodyAcc_std_Z))

## print whole summary  
  
  arrange(as.data.frame(summary))

## Write the two created tidy dataframes to respective files  
    
  write.table(TidiedTrainTestData, "TidiedTrainTestData", row.name = FALSE)
  write.table(summary, "summary", row.name = FALSE)
