---
title: "Codebook"
author: "Anonymous"
date: "Wednesday, May 20, 2015"
output: word_document
---

#The final variables are:
tBodyAcc-mean()-X    tBodyAcc-mean()-Y	tBodyAcc-mean()-Z	tGravityAcc-mean()-X	tGravityAcc-mean()-Y	tGravityAcc-mean()-Z	tBodyAccJerk-mean()-X	tBodyAccJerk-mean()-Y	tBodyAccJerk-mean()-Z	tBodyGyro-mean()-X	tBodyGyro-mean()-Y	tBodyGyro-mean()-Z	tBodyGyroJerk-mean()-X	tBodyGyroJerk-mean()-Y	tBodyGyroJerk-mean()-Z	fBodyAcc-mean()-X	fBodyAcc-mean()-Y	fBodyAcc-mean()-Z	fBodyAccJerk-mean()-X	fBodyAccJerk-mean()-Y	fBodyAccJerk-mean()-Z	fBodyGyro-mean()-X	fBodyGyro-mean()-Y	fBodyGyro-mean()-Z.

The firt step consisted in binding the datasets: X_test, y_test, ,subject_test, X_train, y_test, ,and subject_test. The taining and testing data sets were combined. Then the features were included as colnames adn the data was ordered by subjet.

Following, some text work was done in oder to detect the columns refered to teh means and sds.
The variable Actvity was recoded.

Finally, a workig of split and aplly was done in order to compute the means by person and by activity.




