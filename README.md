## Summary 
This script follows the steps outlined in the project requirements 
[https://class.coursera.org/getdata-012/human_grading/view/courses/973499/assessments/3/submissions]

> You should create one R script called run_analysis.R that does the following. 
> 1. Merges the training and the test sets to create one data set. \s\s
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. \s\s
> 3. Uses descriptive activity names to name the activities in the data set. \s\s
> 4. Appropriately labels the data set with descriptive variable names. \s\s
> 5 From the data set in step 4, creates a second, independent tidy data set with the  \s\s
average of each variable for each activity and each subject. \s\s

Main Source is Coursera discussion led by TA David Hood
[https://class.coursera.org/getdata-012/forum/thread?thread_id=9]
 

# Step 1
Read in data by the read.table command of the subjectIDs, activity results and activity
descriptions during test phase.
This is followed by the reading in the same data the train phase.
All the data is explicitly read in as numeric to allow mean average function later.

The test and train activity data is concatenated by combining rows by command rbind().


# Step 2
All the activity data variable names are read in from the features.txt file.
The  mean and standard deviation (std) variables are identified by a regular expression 
search for the suffixes "-mean" or "-std". These explicit means and standard deviations
of measurements and total some 79 measurements.
As a result, they are more than sufficient to address any reasonable analysis question.
Measures that rely on calculating a mean during their calculation are ignored because 
they do not met the criteria and appear irrelevant.

The numerical values of extracted measures provide the column numbers of the required 
variables from the X_total dataset 

The command features[extracted_measures,2]  produces list of feature names that are
extracted as measures. 


# Step 3 
From the previously mentioned source of a Coursera discussion 
[https://class.coursera.org/getdata-012/forum/thread?thread_id=9]

>Is descriptive activity names things like "Walking" and "Walking Up"
>Yes, you need to get the activity numbers in the data and replace them with descriptive terms which are words.

The R code takes the list of activity labels for test and train phase, and combines them 
by the command rbind(). The new vector is called "y_total".
A column is added to "y_total" which describes the activity based on the activity label
in the original column.


# Step 4
The lecture in week 4 Editing Text Variables, provides details on tidy data principles
for variables. 

> Names of variables should be;
> - All lower case when possible
> - Descriptive (Diagnosis versus Dx)
> - Not duplicated
> - Not have underscores or dots or white spaces

> Variables with character values [Needs to research More]
> - Should usually be made into factor variables (depends on application)
> - Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female versus 0/1 or M/F)

The R code implements this by 
 - Making upper case the first letter of "mean" and "std" in a variable name
 - Remove all punctuation from the variable names such as "-" and "()"
 - Trim the variable name at both beginning and end. (Note requires library "stringr")
 
Finally all the subject IDs are concatenated by combining the test and train data.

The final raw dataset called datasetFinal, combines the columns of;
 - subject data from columns in subject_total
 - activity labels and descriptions from columns in y_total
 - normalised activity numerical data from columns in dataset


# Step 5
The aggregate() command groups the activity measurement data by activity 
description *or* subject ID. The numerical measure undergo a mean function.

A arrange() command from the library plyr sorts the subject ids, that comprise the 
new group column.

The values in the new group column are prepended by a paste() or paste0() command, with 
either "Activity" or "SubjectID" aid human readability and make the data tidy. 

Finally the data from the two aggregations is concatenated, and written to a file 
without the unnecessary row names. The lack or row names improves tidiness, by removing a
distracting column.

The following test was successful
data  <- read.table("tidy_total.txt", header=TRUE)

END
---