# This is the run_analysis file that does all of the getting and cleaning data (except that the file was downloaded to my computer 
# outside of this code

# I first downloaded the data into my working folder.  I did this outside of R since I was not too familiar with how
# to handle using a ZIP file.

#Read in the data into R
test <- read.table("./Documents/UCI HAR Dataset/test/X_test.txt",sep=",",header=FALSE)
train <-read.table("./Documents/UCI HAR Dataset/train/X_train.txt",sep=",",header=FALSE)
dim(test);dim(train)

#Read in the Subjects - Subject IDs run from 1-30
testSubject <- read.table("./Documents/UCI HAR Dataset/test/subject_test.txt",sep=",",header=FALSE)
trainSubject <-read.table("./Documents/UCI HAR Dataset/train/subject_train.txt",sep=",",header=FALSE)
dim(testSubject); dim(trainSubject)

#Read in the Activity
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
testActivity <- read.table("./Documents/UCI HAR Dataset/test/y_test.txt",sep=",",header=FALSE)
trainActivity<-read.table("./Documents/UCI HAR Dataset/train/y_train.txt",sep=",",header=FALSE)
dim(testSubject); dim(trainSubject)

#Merge the datasets together
##First, rbind the test and train sets for each of the metrics (Data, Subject, Activity)
expdata <- rbind(test,train)
subjects <- rbind(testSubject,trainSubject)
activity <- rbind(testActivity,trainActivity)

##Next, cbind these variables together to form full dataset
completedata <- cbind(expdata,subjects,activity)
dim(completedata)

table(completedata[,2:3])

#Reading in the Inertial Signals data
#Test
bodyAccXTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE)
bodyAccYTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE)
bodyAccZTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE)
bodyGyroXTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE)
bodyGyroYTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE)
bodyGyroZTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE)
totalAccXTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE)
totalAccYTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE)
totalAccZTest <- read.table("./Documents/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE)
dim(bodyAccXTest);dim(bodyAccYTest);dim(bodyAccZTest);dim(bodyGyroXTest);dim(bodyGyroYTest);
dim(bodyGyroZTest);dim(totalAccXTest);dim(totalAccYTest);dim(totalAccZTest);

#Test
bodyAccXTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=FALSE)
bodyAccYTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=FALSE)
bodyAccZTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=FALSE)
bodyGyroXTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=FALSE)
bodyGyroYTrain<- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=FALSE)
bodyGyroZTrain<- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=FALSE)
totalAccXTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE)
totalAccYTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE)
totalAccZTrain <- read.table("./Documents/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=FALSE)
dim(bodyAccXTrain);dim(bodyAccYTrain);dim(bodyAccZTrain);dim(bodyGyroXTrain);dim(bodyGyroYTrain);
dim(bodyGyroZTrain);dim(totalAccXTrain);dim(totalAccYTrain);dim(totalAccZTrain);

#rbind the test and train sets together
bodyAccX <- rbind(bodyAccXTest,bodyAccXTrain)
bodyAccY <- rbind(bodyAccYTest,bodyAccYTrain)
bodyAccZ <- rbind(bodyAccZTest,bodyAccZTrain)
bodyGyroX <- rbind(bodyGyroXTest,bodyGyroXTrain)
bodyGyroY <- rbind(bodyGyroYTest,bodyGyroYTrain)
bodyGyroZ <- rbind(bodyGyroZTest,bodyGyroZTrain)
totalAccX <- rbind(totalAccXTest,totalAccXTrain)
totalAccY <- rbind(totalAccYTest,totalAccYTrain)
totalAccZ <- rbind(totalAccZTest,totalAccZTrain)
dim(bodyAccX);dim(bodyAccY);dim(bodyAccZ);dim(bodyGyroX);dim(bodyGyroY);dim(bodyGyroZ);
dim(totalAccX);dim(totalAccY);dim(totalAccZ);

#Now it is time to pull out the mean and stdev for each of the above measures and put those in our dataset
bodyAccXMean <-apply(bodyAccX,1,mean)
bodyAccXStdv <-apply(bodyAccX,1,sd)
bodyAccYMean <-apply(bodyAccY,1,mean)
bodyAccYStdv <-apply(bodyAccY,1,sd)
bodyAccZMean <-apply(bodyAccZ,1,mean)
bodyAccZStdv <-apply(bodyAccZ,1,sd)
bodyGyroXMean <-apply(bodyGyroX,1,mean)
bodyGyroXStdv <-apply(bodyGyroX,1,sd)
bodyGyroYMean <-apply(bodyGyroY,1,mean)
bodyGyroYStdv <-apply(bodyGyroY,1,sd)
bodyGyroZMean <-apply(bodyGyroZ,1,mean)
bodyGyroZStdv <-apply(bodyGyroZ,1,sd)
totalAccXMean <-apply(totalAccX,1,mean)
totalAccXStdv <-apply(totalAccX,1,sd)
totalAccYMean <-apply(totalAccY,1,mean)
totalAccYStdv <-apply(totalAccY,1,sd)
totalAccZMean <-apply(totalAccZ,1,mean)
totalAccZStdv <-apply(totalAccZ,1,sd)

#cbind the variables together along with the existing completedata file
completedata <-cbind(completedata,bodyAccXMean,bodyAccXStdv,bodyAccYMean,bodyAccYStdv,bodyAccZMean,bodyAccZStdv, bodyGyroXMean,bodyGyroXStdv,bodyGyroYMean,bodyGyroYStdv,bodyGyroZMean,bodyGyroZStdv,totalAccXMean,totalAccXStdv,totalAccYMean,totalAccYStdv,totalAccZMean,totalAccZStdv)
names(completedata)<-c("expdata","subjects","activity","bodyAccXMean","bodyAccXStdv","bodyAccYMean","bodyAccYStdv","bodyAccZMean","bodyAccZStdv","bodyGyroXMean","bodyGyroXStdv","bodyGyroYMean","bodyGyroYStdv","bodyGyroZMean","bodyGyroZStdv","totalAccXMean","totalAccXStdv","totalAccYMean","totalAccYStdv","totalAccZMean","totalAccZStdv")
completedata$expdata <-as.numeric(completedata$expdata)
completedata$subjects<-as.factor(completedata$subjects)
completedata$activity<-as.factor(completedata$activity)
levels(completedata$activity) <-c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting","Standing","Laying")

str(completedata)

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
#The plan is to have a new dataset that will have a row for each Subject/Activity combination and a column for each metric containing the average values across the different readings
#Create a variable that combines Subjects and Activities
completedata$SubjectActivity <-paste(completedata$subjects," : ",completedata$activity)
completedata$SubjectActivity <-as.factor(completedata$SubjectActivity)
#create the variables to put into the new dataset

bodyAccXMeanAvg<-tapply(completedata[,4], completedata$SubjectActivity, function(x) mean(x))
SubjectActivity <- as.factor(names(bodyAccXMeanAvg))
bodyAccXStdvAvg<-tapply(completedata[,5], completedata$SubjectActivity, function(x) mean(x))
bodyAccYMeanAvg<-tapply(completedata[,6], completedata$SubjectActivity, function(x) mean(x))
bodyAccYStdvAvg<-tapply(completedata[,7], completedata$SubjectActivity, function(x) mean(x))
bodyAccZMeanAvg<-tapply(completedata[,8], completedata$SubjectActivity, function(x) mean(x))
bodyAccZStdvAvg<-tapply(completedata[,9], completedata$SubjectActivity, function(x) mean(x))
bodyGyroXMeanAvg<-tapply(completedata[,10], completedata$SubjectActivity, function(x) mean(x))
bodyGyroXStdvAvg<-tapply(completedata[,11], completedata$SubjectActivity, function(x) mean(x))
bodyGyroYMeanAvg<-tapply(completedata[,12], completedata$SubjectActivity, function(x) mean(x))
bodyGyroYStdvAvg<-tapply(completedata[,13], completedata$SubjectActivity, function(x) mean(x))
bodyGyroZMeanAvg<-tapply(completedata[,14], completedata$SubjectActivity, function(x) mean(x))
bodyGyroZStdvAvg<-tapply(completedata[,15], completedata$SubjectActivity, function(x) mean(x))
totalAccXMeanAvg<-tapply(completedata[,16], completedata$SubjectActivity, function(x) mean(x))
totalAccXStdvAvg<-tapply(completedata[,17], completedata$SubjectActivity, function(x) mean(x))
totalAccYMeanAvg<-tapply(completedata[,18], completedata$SubjectActivity, function(x) mean(x))
totalAccYStdvAvg<-tapply(completedata[,19], completedata$SubjectActivity, function(x) mean(x))
totalAccZMeanAvg<-tapply(completedata[,20], completedata$SubjectActivity, function(x) mean(x))
totalAccZStdvAvg<-tapply(completedata[,21], completedata$SubjectActivity, function(x) mean(x))
rownames(bodyAccXMeanAvg)<-rownames(bodyAccXStdvAvg)<-rownames(bodyAccYMeanAvg)<-rownames(bodyAccYStdvAvg)<-rownames(bodyAccZMeanAvg)<-rownames(bodyAccZStdvAvg)<-rownames(bodyGyroXMeanAvg)<-rownames(bodyGyroXStdvAvg)<-rownames(bodyGyroYMeanAvg)<-rownames(bodyGyroYStdvAvg)<-rownames(bodyGyroZMeanAvg)<-rownames(bodyGyroZStdvAvg)<-rownames(totalAccXMeanAvg)<-rownames(totalAccXStdvAvg)<-rownames(totalAccYMeanAvg)<-rownames(totalAccYStdvAvg)<-rownames(totalAccZMeanAvg)<-rownames(totalAccZStdvAvg)<-NULL
newdataset <- cbind(SubjectActivity,bodyAccXMeanAvg,bodyAccXStdvAvg,bodyAccYMeanAvg,bodyAccYStdvAvg,bodyAccZMeanAvg,bodyAccZStdvAvg,bodyGyroXMeanAvg,bodyGyroXStdvAvg,bodyGyroYMeanAvg,bodyGyroYStdvAvg,bodyGyroZMeanAvg,bodyGyroZStdvAvg,totalAccXMeanAvg,totalAccXStdvAvg,totalAccYMeanAvg,totalAccYStdvAvg,totalAccZMeanAvg,totalAccZStdvAvg)
names(newdataset) <- c("SubjectActivity","bodyAccXMeanAvg","bodyAccXStdvAvg","bodyAccYMeanAvg","bodyAccYStdvAvg","bodyAccZMeanAvg","bodyAccZStdvAvg","bodyGyroXMeanAvg","bodyGyroXStdvAvg","bodyGyroYMeanAvg","bodyGyroYStdvAvg","bodyGyroZMeanAvg","bodyGyroZStdvAvg","totalAccXMeanAvg","totalAccXStdvAvg","totalAccYMeanAvg","totalAccYStdvAvg","totalAccZMeanAvg","totalAccZStdvAvg")

write.table(newdataset,"newdataset.txt",row.names=FALSE)
