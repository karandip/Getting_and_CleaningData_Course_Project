---
title: "ReadMe.md"
author: "me"
date: "Sunday 26 April 2015"
output: html_document
---




The script **run_analysis.R** performs :
        
1. loading training and test data
2. binding the train and test data based on the list of selected features
3. Renaming the columns with descriptive names
4. Giving descriptive activity names
5. Genarate final tidy data with average of each variable for each activity and each subject.

#### Requirements

Need package *dplyr* to run the script.

Working directory contains the unzipped UCI HAR Dataset folder.