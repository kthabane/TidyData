run_analysis<- function()
{

        
        
# If required packages are not present then install them.
if("reshape2" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape2")};library(reshape2)

print("STEP 1 : Load required packages - completed")

#Declare all variables 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
filename <- "dataset.zip"
directory<-"UCI HAR Dataset"
actLabelsFile<-"UCI HAR Dataset/activity_labels.txt"
featFile<-"UCI HAR Dataset/features.txt"
train_XFile<-"UCI HAR Dataset/train/X_train.txt"
test_XFile<-"UCI HAR Dataset/test/X_test.txt"
train_YFile<-"UCI HAR Dataset/train/Y_train.txt"
test_YFile<-"UCI HAR Dataset/test/Y_test.txt"
train_SubFile<-"UCI HAR Dataset/train/subject_train.txt"
test_SubFile<-"UCI HAR Dataset/test/subject_test.txt"

print("STEP 2: Declare/setup all constant variables - completed")
##-----------------------------------------------------------------
## Download and unzip the dataset:
if (!file.exists(filename)){
       
        download.file(fileURL, filename, method="curl",quiet=TRUE)
}  
if (!file.exists(directory)) { 
        unzip(filename) 
}
##----------------------------------------------------------------
print("STEP 3: Download Zip File and Unzip - completed")
# Load  features

features <- read.table(featFile,header = FALSE)
features[,2] <- as.character(features[,2])

##-----------------------------------------------------------------
# Extract only the data on mean and standard deviation
Data <- grep(".*mean.*|.*std.*", features[,2])
Data.names <- features[Data,2]
Data.names = gsub('-mean', 'Mean', Data.names)
Data.names = gsub('-std', 'Std', Data.names)
Data.names <- gsub('[-()]', '', Data.names)


print("STEP 4: Load features files and extract all 'mean' and 'std' pieces -completed")

##------------------------------------------------------------------

# Load the datasets (Extract the training set data and test set data)
trainSet <- read.table(train_XFile,header = FALSE)[Data]
testSet <- read.table(test_XFile,header = FALSE)[Data]

# Load the datasets (Extract the training set data labels and test set data labels)
trainLabels <- read.table(train_YFile,header = FALSE)
testLabels <- read.table(test_YFile,header = FALSE)

# Load the datasets (Extract the training and test set data -Each row identifies the subject who performed the activity)
trainSubjects <- read.table(train_SubFile,header = FALSE)
testSubjects <- read.table(test_SubFile,header = FALSE)

#Concatenates the datasets per train or test category and combines the three components in the columns
trainSet <- cbind(trainSubjects, trainLabels, trainSet)
testSet <- cbind(testSubjects, testLabels, testSet)

print("STEP 5: Load all train and test data sets from the 'X','Y' and 'Subject' files - completed")
##---------------------------------------------------------------------
# merge datasets and add labels (As one big data set)
allData <- rbind(trainSet, testSet)
#Put descriptive column names
colnames(allData) <- c("subject", "activity", Data.names)

print("STEP 6: Aggregate all train and test data together,then put descriptive labels -completed")
##----------------------------------------------------------------------
#Load the activity labels
activityLabels <- read.table(actLabelsFile, header = FALSE)
activityLabels[,2] <- as.character(activityLabels[,2])

##----------------------------------------------------------------------
#  (break out by levels and lables)
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

print("STEP 7: Convert the dataset into a factor data type -completed")
##-----------------------------------------------------------------------
#Compute the mean then Write out result to file
write.table(dcast(melt(allData, id = c("subject", "activity")), subject + activity ~ variable, mean), file="tidy.txt", row.names = FALSE, quote = FALSE)

print("STEP 8: Compute the mean for all variables and write out to output -completed")
##-----------------------------------------------------------------------
#Remove zip file
file.remove(filename)
#Clean up all the data except the result output
unlink(directory,recursive = TRUE, force = TRUE)
##-----------------------------------------------------------------------

print("STEP 9: Remove the originally downloaded zip file and the unzipped folder -completed")
print("STEP 10: ALL steps completed.")
}