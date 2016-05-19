# Getting-and-Cleaning-Data-Course
Assignment of Coursera Getting And Cleaning Data Course

This script creates two tidy files based on a dataset of the Human Activity Recognition Using Smartphones Dataset Project:

The script adds the test- and traindata together in a single collection dataframe: joinedTrainTestData; Only the involved mean and Standard Deviation components were selected: "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z"

Also the train and test labels are added together in a single dataframe.

Thus the "lable-id" and "activity" are merged to above collection dataframe, based on matching labels with their respective train and testdata.

Also the train and test subjects are added together in a single dataframe; the subject_ids are merged to above collection dataframe

Thus the "subject-id" is merged to above collection dataframe, based on matching subjects with their respective train and testdata.

Appropriete header data is added to the dataframes.

Then the first tidy dataframe is derived from the collection dataframe: TidiedTrainTestData, containing: "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z" and "activity". 

This dataframe is printed and written as TidiedTrainTestData.txt to the working directory.

Consequently a second data frame is derived from the collection dataframe: TidiedAverageData containing: "subject_id", "activity_id", "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z", which is "grouped_by" subject and activity.
The result "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z" is then "summarized" by their means.

This summary result is saved as a dataframe (to obtain all output), printed and written as summary.txt to the working directory.
