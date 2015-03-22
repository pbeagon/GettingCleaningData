# You should create one R script called run_analysis.R that does the following. 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.


#############################################################################
# Step 1: Merge the training and the test sets to create one data set.

# Read in data on the subjectIDs, activity results and activity descriptions during test phase
setwd("~/Documents/Coursera/03_Getting_Cleaning_Data/project/UCI HAR Dataset/test")

subject_test <- read.table("subject_test.txt", header = FALSE, colClasses = "numeric")
X_test <- read.table("X_test.txt", header = FALSE, colClasses = "numeric") 
y_test <- read.table("y_test.txt", header = FALSE, colClasses = "numeric") 

# Read in data on the subjectIDs, activity results and activity descriptions during train phase
setwd("~/Documents/Coursera/03_Getting_Cleaning_Data/project/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt", header = FALSE, colClasses = "numeric")
X_train <- read.table("X_train.txt", header = FALSE, colClasses = "numeric") 
y_train <- read.table("y_train.txt", header = FALSE, colClasses = "numeric") 

# Concatenate the activity data into a table of all variables of both test and train
X_total <- rbind(X_test, X_train)


#######################################################################################
# Step 2 Extract only the measurements on the mean and standard deviation for each measurement. 

setwd("~/Documents/Coursera/03_Getting_Cleaning_Data/project/UCI HAR Dataset")

# Read in the Variable names from the feature.txt file.
features <- read.table("features.txt", header = FALSE, colClasses = "character")

# Extract the measures calculating mean and standard deviation (std)
extracted_measures  <- grep("-mean|-std",features[,2], ignore.case = TRUE)

# The numerical values of extracted measures, select the desired columns of activity data
dataset  <- X_total[,extracted_measures]

# features[extracted_measures,2]    produces list of features that are extracted as measures. 


#############################################################################
## Step 3:  Uses descriptive activity names to name the activities in the data set

# Concatenate the activity labels
y_total <- rbind(y_test, y_train)

# Replace default name variable name with descriptive name 
names(y_total)[1]  <- "activityLabel"

# Insert second variable with descriptive values derived from activity labels 
y_total$activityDescription[y_total$activityLabel == 1]  <- "Walking"
y_total$activityDescription[y_total$activityLabel == 2]  <- "Walking Upstairs"
y_total$activityDescription[y_total$activityLabel == 3]  <- "Walking Downstairs"
y_total$activityDescription[y_total$activityLabel == 4]  <- "Sitting "
y_total$activityDescription[y_total$activityLabel == 5]  <- "Standing"
y_total$activityDescription[y_total$activityLabel == 6]  <- "Laying"

#############################################################################
# Step 4: Appropriately labels the data set with descriptive variable names

# Uppercase the 1st letter of the terms "mean" and "std" in the extracted measures
measuresList <- features[extracted_measures,2]
measuresList <- sub("mean","Mean",measuresList)
measuresList <- sub("std","Std",measuresList)

# Remove punctuation from the extracted measures e.g. "-" and "()"
measuresList <- gsub("[[:punct:]]","",measuresList)

# Remove any blank spaces before or after the measure name
library(stringr)
measuresFinal <- str_trim(measuresList, side = "both")

# Update the varable names from defaults (V1, V2 etc.) to descriptive measure names
names(dataset)  <- measuresFinal

#Concatenate the list of subjectIDs and name column variable
subject_total <- rbind(subject_test, subject_train)
names(subject_total)  <- "subjectID"

# Combine the subjectID column to make the final raw dataset
datasetFinal  <-  cbind(subject_total,y_total,dataset)

##################################################################################
# Step 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(plyr)

# Group the activity data by activity description and perform a mean function
tidy_activity <- aggregate(datasetFinal[,-c(1,2,3)], by=list(datasetFinal$activityDescription), FUN=mean)

# Insert the text "Activity:" to improve readability in new group column
tidy_activity[,1] <- paste("Activity:",tidy_activity[,1])

# Group the activity data by subject ID, perform a mean function, then sort by plyr "arrange" command
tidy_subject  <- aggregate(datasetFinal[,-c(1,2,3)], by=list(datasetFinal$subjectID), FUN=mean)
tidy_subject<- arrange(tidy_subject, tidy_subject$Group.1)

# Insert the text "SubjectID:" to improve readability in new group column
tidy_subject[,1] <- paste("SubjectID:",tidy_subject[,1])

# Concatenate the rows groupd by activity and subject
tidy_total  <-  rbind(tidy_activity, tidy_subject)

# Insert the text "average" before the variable names due to the previous averaging 
names(tidy_total)  <- paste0("average",names(tidy_total))

# Clarify the first column name, that groups the activity data prior to averaging
names(tidy_total)[1]  <- "groupDescription"

# Write tidy data as requested in project upload instructions
write.table(tidy_total,"tidy_total.txt", row.name=FALSE) 