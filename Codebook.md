# Codebook for run_analysis.R

Note: all the read-in data, from .txt assumed the first row was not a header.

## Step 1 Variables

*X_test*  Read-in table of data from X_test.txt, the variables data from test phase <br>
*y_test*  Read-in table of data from y_test.txt, the variables labels from test phase <br>
*X_train* Read-in table of data from X_train.txt, the variables data from train phase <br>
*y_train* Read-in table of data from y_train.txt, the variables labels from train phase <br>

*X_total* Concatenated table of the activity data of all variables of both test and train <br>	


## Step 2 Variables
*features* Read-in table for data from the features.txt. A list of activities which are <br>
variables of normalised numerical data.

*extracted_measures* A list of integers matching the relevant variable columns of mean <br>
and std measures

*dataset* data table of all the activity variables without activity description or subject Ids


## Step 3 Variables 

*y_total* Concatenated table of the activity labels from test and train phases. <br>

This table contains two columns on Step 3 completion: activityLabel and activityDescription

## Step 4 Variables

*measuresList* List of relevant measurement variable names during cleaning <br>
*measuresFinal*  List of relevant measurement variable names after cleaning and trimming <br>
*subject_total* Concatenated table of the activity labels from test and train phases <br>
*datasetFinal* Final dataset after combining columns of subjects, activity description <br>
and activity normalised numerical figures. <br>


## Step 5 Variables

*tidy_activity* Data grouped by activity and subjected to mean average function <br>
*tidy_subject* Data grouped and sorted by subjectID and subjected to mean average function <br>
*tidy_total* Combination of tidy_activity and tidy_subject data tables, including tidiness <br>
added to group column explaining the values. This data is written to file and submitted.