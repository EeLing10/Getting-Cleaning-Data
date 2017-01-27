
# Download the file, save in Data folder and unzip the files

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileUrl, destfile = "./data/dataset.zip", mode="wb", method = "auto") #use 'auto' instead of 'curl'

unzip("./data/dataset.zip",exdir="./data")

# Read the files

filepath <- "./data/UCI HAR Dataset"

SubjectTrain <- read.table(file.path(filepath, "train","subject_train.txt"),header = FALSE)
SubjectTest <- read.table(file.path(filepath, "test","subject_test.txt"),header = FALSE)

DataTrain <- read.table(file.path(filepath, "train","X_train.txt"),header = FALSE)
DataTest <- read.table(file.path(filepath, "test","X_test.txt"),header = FALSE)

ActivityTrain <- read.table(file.path(filepath, "train","Y_train.txt"),header = FALSE)
ActivityTest <- read.table(file.path(filepath, "test","Y_test.txt"),header = FALSE)

DataNames <- read.table(file.path(filepath, "features.txt"),header = FALSE)

# Merge training and test sets

MergedSubject <- rbind(SubjectTrain,SubjectTest)
MergedData <- rbind(DataTrain,DataTest)
MergedActivity <- rbind(ActivityTrain,ActivityTest)

# Set the header names to the tables
names(MergedSubject) <- "Subject"
names(MergedActivity) <- "Activity"
names(MergedData) <- DataNames$V2

CombinedData <- cbind(MergedSubject, MergedActivity, MergedData)

# Extract only the Mean and Standard deviation measurements
MeanSdData <- CombinedData[,grep("Subject|Activity|mean|std",names(CombinedData))]

# Use descriptive names for the activities using activity_labels.txt
ActivityLabels <- read.table(file.path(filepath, "activity_labels.txt"),header = FALSE)
MeanSdData$Activity <- ActivityLabels[MeanSdData$Activity,2]

# Label data set with descriptive names
names(MeanSdData)<-gsub("std()", "SD", names(MeanSdData))
names(MeanSdData)<-gsub("mean()", "Mean", names(MeanSdData))
names(MeanSdData)<-gsub("^t", "time", names(MeanSdData))
names(MeanSdData)<-gsub("^f", "frequency", names(MeanSdData))
names(MeanSdData)<-gsub("Acc", "Accelerometer", names(MeanSdData))
names(MeanSdData)<-gsub("Gyro", "Gyroscope", names(MeanSdData))
names(MeanSdData)<-gsub("Mag", "Magnitude", names(MeanSdData))
names(MeanSdData)<-gsub("BodyBody", "Body", names(MeanSdData))

# Create a separate tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
MeanSdData_Melted <- melt(MeanSdData, id=c("Subject","Activity"))
MeanSdData_Tidy <- dcast(MeanSdData_Melted, Subject + Activity ~ variable, mean)

# Write final tidy data to text file
write.table(MeanSdData_Tidy, file = "TidyData.txt", row.names = FALSE)