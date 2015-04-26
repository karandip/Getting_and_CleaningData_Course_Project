---
title: "CodeBook.md"
author: "me"
date: "Sunday 26 April 2015"
output: html_document
---

Out of 561 features available in this dataset, keep only the necessary features.

The static activities(sitting, standing, laying) can be distinguished from the dynamic activities(walking, walking-up, walking-down) directly using the BodyAccelarationMagnitude feature.

Angle variables will be useful to differentiate lay v/s stand and walking-up v/s walking-down.

Acceleration and Jerk variables will be useful for distinguishing the dynamic activities while filtering the random vibrations or shaking(usually resulting from weakness or stress or disease) in static actvities. 

XYZ variables are corrrelated with Mag and angle variables. So, we can drop XYZ variables while keeping Mag and angle variables as already explained above their usefulness in distinguishing the features.

Band variables may be dropped as we can't see any relationship with the activites.

min, max and mad variables have high correlation with mean or std  variables. So, retain mean and std variables.



### Final selected features

    tBodyAccMag-mean(), tBodyAccMag-std(), tBodyAccJerkMag-mean(), tBodyAccJerkMag-std()
    tBodyGyroMag-mean(), tBodyGyroMag-std(), tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std()
    fBodyAccMag-mean(), fBodyAccMag-std(), fBodyAccMag-skewness(), fBodyAccMag-kurtosis()
    fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std(), fBodyBodyAccJerkMag-skewness(), fBodyBodyAccJerkMag-kurtosis()
    fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), fBodyBodyGyroMag-skewness(), fBodyBodyGyroMag-kurtosis()
    fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std(), fBodyBodyGyroJerkMag-skewness(), fBodyBodyGyroJerkMag-kurtosis()
    fBodyAccMag-meanFreq(), fBodyBodyAccJerkMag-meanFreq(), fBodyBodyGyroMag-meanFreq(), fBodyBodyGyroJerkMag-meanFreq()
    angle(tBodyAccMean,gravity), angle(tBodyAccJerkMean),gravityMean), angle(tBodyGyroMean,gravityMean), angle(tBodyGyroJerkMean,gravityMean)
    angle(X,gravityMean), angle(Y,gravityMean), angle(Z,gravityMean)




This features may not be the best selection of features. Some of the dropped features may have increased the efficiency in the final model. However, it is better to create the initial model using only the necessary features selected based on the domain knowledge. If the final model shows low accurracy, then it will be certainly due to our oversight. We can then check dropped features to be again added to dataset.


### Name Transformation :

    tAccMean, tAccSD tJerkMean, tJerkSD
    tGyroMean, tGyroSD tGyroJerkMean, tGyroJerkSD
    fAccMean, fAccSD,fAccSkewness, fAccKurtosis
    fJerkMean, fJerkSD, fJerkSkewness, fJerkKurtosis
    fGyroMean, fGyroSD,fGyroSkewness, fGyroKurtosis
    fGyroJerkMean, fGyroJerkSD,fGyroJerkSkewness, fGyroJerkKurtosis
    fGyroMeanFreq, fGyroJerkMeanFreq fAccMeanFreq, fJerkMeanFreq
    angleAccGravity, angleJerkGravity angleGyroGravity, angleGyroJerkGravity
    angleXGravity, angleYGravity, angleZGravity
    subject, activity



The description of each variable is given in *features_info.txt*.