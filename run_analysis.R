#Trying to download and unzip the data
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",
#               "Dataset.zip")
# unzip("Dataset.zip", list=TRUE)
# a=unzip("getdata-projectfiles-UCI HAR Dataset.zip", list=TRUE)
# unzip("getdata-projectfiles-UCI HAR Dataset.zip", list=TRUE)
# 
# unzip("Dataset.zip", list=TRUE)

#As there is a problem I download and unzip manualy the data. Then load: 
xtest=read.table("Dataset/UCI HAR Dataset/test/X_test.txt")
ytest=read.table("Dataset/UCI HAR Dataset/test/y_test.txt")
subjectTest=read.table("Dataset/UCI HAR Dataset/test/subject_test.txt")
xtrain=read.table("Dataset/UCI HAR Dataset/train/X_train.txt")
ytrain=read.table("Dataset/UCI HAR Dataset/train/y_train.txt")
subjectTrain=read.table("Dataset/UCI HAR Dataset/train/subject_train.txt")
features=read.table("Dataset/UCI HAR Dataset/features.txt")
activityLabels=read.table("Dataset/UCI HAR Dataset/activity_labels.txt")

#### Let's create the objects testData, trainData and data
testData=cbind(subjectTest, ytest, xtest)
colnames(testData) <- c("Subject", "Activity", as.character(features[,2]))
trainData=cbind(subjectTrain, ytrain, xtrain)
colnames(trainData) <- c("Subject", "Activity", as.character(features[,2]))
data=rbind(trainData, testData)

#Sorting by Subject
library(plyr)
data=arrange(data, data$Subject)

#Detecting mean an sd columns, then creating newData object with means and sds
Mean=data[,grep("[-mean()-]{8,8}", colnames(data))]
Std=data[,grep("[-std()-]{7,10}", colnames(data))]
newData=mutate()
newData=cbind(data$Subject, data$Activity, Mean, Std)
colnames(newData)[1]="Subject"
colnames(newData)[2]="Activity"

#Changing the labels of Activity
for (i in activityLabels[,1]){
    newData$Activity[newData$Activity==i]  <- as.character(activityLabels[i,2])
}   
newData=cbind(newData[,1:2],newData[,grep("[-mean()-]{8,8}", colnames(newData))])

#Computing means by Subject, by Activity, and by both.
sa=split(newData[,-c(1:2)], as.factor(newData$Subject))
MeanBySubject=t(sapply(sa, function(x) colMeans(x)))
sb=split(newData[,-c(1:2)], as.factor(newData$Activity))
MeanByActivity=t(sapply(sb, function(x) colMeans(x)))
sc=split(newData[,-c(1:2)], list(as.factor(newData$Subject), as.factor(newData$Activity)))
MeanBySubjectAndActivity=t(sapply(sc,function(x) colMeans(x)))

