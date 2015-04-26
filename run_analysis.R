library("dplyr")

#       loading training and test data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")



#       list of selected features
selected_features <- c(201,202,227,228,240,241,253,254,503,504,514,515,516,517,
                       527,528,529,530,540,541,542,543,553,554,513,526,539,552,
                       555,556,557,558,559,560,561)

#       binding the train and test data
test <- cbind(X_test[,selected_features],subject_test,y_test)
train <- cbind(X_train[,selected_features],subject_train,y_train)

rm(X_test);rm(y_test);rm(subject_test);rm(X_train);rm(y_train);rm(subject_train)

data <- rbind(test,train)
rm(test);rm(train)

#       Renaming the columns with descriptive names
new_names <- c("tAccMean","tAccSD","tJerkMean","tJerkSD",
               "tGyroMean","tGyroSD","tGyroJerkMean","tGyroJerkSD",
               "fAccMean","fAccSD","fAccSkewness","fAccKurtosis",
               "fJerkMean","fJerkSD","fJerkSkewness","fJerkKurtosis",
               "fGyroMean","fGyroSD","fGyroSkewness","fGyroKurtosis",
               "fGyroJerkMean","fGyroJerkSD","fGyroJerkSkewness","fGyroJerkKurtosis",
               "fAccMeanFreq","fJerkMeanFreq","fGyroMeanFreq","fGyroJerkMeanFreq",
               "angleAccGravity","angleJerkGravity","angleGyroGravity","angleGyroJerkGravity",
               "angleXGravity","angleYGravity","angleZGravity",
               "subject","activity")
colnames(data) <- new_names

# Giving descriptive activity names
data$activity <- activity_labels[data$activity,"V2"]


# Final tidy data with average of each variable for each activity and each subject.

final_data <- data %>% group_by(subject,activity) %>% summarise_each(funs(mean))
