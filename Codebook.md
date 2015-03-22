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



## Tidying of Activity Measurement Variables

Activity measurement variables contain the normalised numerical data.
A total of 79 variables are considered relevant due to matching on -mean or -std.
The evolution of the variable names through the scripts generated tables appears below.

**measuresFinal**	**datasetFinal**	**Tidy_total**
tBodyAcc-mean()-X	tBodyAccMeanX	averagetBodyAccMeanX               
tBodyAcc-mean()-Y	tBodyAccMeanY	 averagetBodyAccMeanY               
tBodyAcc-mean()-Z	tBodyAccMeanZ	 averagetBodyAccMeanZ               
tBodyAcc-std()-X	tBodyAccStdX	 averagetBodyAccStdX                
tBodyAcc-std()-Y	tBodyAccStdY	 averagetBodyAccStdY                
tBodyAcc-std()-Z	tBodyAccStdZ	 averagetBodyAccStdZ                
tGravityAcc-mean()-X	tGravityAccMeanX	 averagetGravityAccMeanX            
tGravityAcc-mean()-Y	tGravityAccMeanY	  averagetGravityAccMeanY            
tGravityAcc-mean()-Z	tGravityAccMeanZ	  averagetGravityAccMeanZ            
tGravityAcc-std()-X	tGravityAccStdX	 averagetGravityAccStdX             
tGravityAcc-std()-Y	tGravityAccStdY	 averagetGravityAccStdY             
tGravityAcc-std()-Z	tGravityAccStdZ	 averagetGravityAccStdZ             
tBodyAccJerk-mean()-X	tBodyAccJerkMeanX	 averagetBodyAccJerkMeanX           
tBodyAccJerk-mean()-Y	tBodyAccJerkMeanY	 averagetBodyAccJerkMeanY           
tBodyAccJerk-mean()-Z	tBodyAccJerkMeanZ	 averagetBodyAccJerkMeanZ           
tBodyAccJerk-std()-X	tBodyAccJerkStdX	 averagetBodyAccJerkStdX            
tBodyAccJerk-std()-Y	tBodyAccJerkStdY	 averagetBodyAccJerkStdY            
tBodyAccJerk-std()-Z	tBodyAccJerkStdZ	 averagetBodyAccJerkStdZ            
tBodyGyro-mean()-X	tBodyGyroMeanX	 averagetBodyGyroMeanX              
tBodyGyro-mean()-Y	tBodyGyroMeanY	 averagetBodyGyroMeanY              
tBodyGyro-mean()-Z	tBodyGyroMeanZ	 averagetBodyGyroMeanZ              
tBodyGyro-std()-X	tBodyGyroStdX	 averagetBodyGyroStdX               
tBodyGyro-std()-Y	tBodyGyroStdY	 averagetBodyGyroStdY               
tBodyGyro-std()-Z	tBodyGyroStdZ	 averagetBodyGyroStdZ               
tBodyGyroJerk-mean()-X	tBodyGyroJerkMeanX	 averagetBodyGyroJerkMeanX          
tBodyGyroJerk-mean()-Y	tBodyGyroJerkMeanY	 averagetBodyGyroJerkMeanY          
tBodyGyroJerk-mean()-Z	tBodyGyroJerkMeanZ	 averagetBodyGyroJerkMeanZ          
tBodyGyroJerk-std()-X	tBodyGyroJerkStdX	 averagetBodyGyroJerkStdX           
tBodyGyroJerk-std()-Y	tBodyGyroJerkStdY	 averagetBodyGyroJerkStdY           
tBodyGyroJerk-std()-Z	tBodyGyroJerkStdZ	 averagetBodyGyroJerkStdZ           
tBodyAccMag-mean()	tBodyAccMagMean	 averagetBodyAccMagMean             
tBodyAccMag-std()	tBodyAccMagStd	 averagetBodyAccMagStd              
tGravityAccMag-mean()	tGravityAccMagMean	 averagetGravityAccMagMean          
tGravityAccMag-std()	tGravityAccMagStd	 averagetGravityAccMagStd           
tBodyAccJerkMag-mean()	tBodyAccJerkMagMean	 averagetBodyAccJerkMagMean         
tBodyAccJerkMag-std()	tBodyAccJerkMagStd	 averagetBodyAccJerkMagStd          
tBodyGyroMag-mean()	tBodyGyroMagMean	 averagetBodyGyroMagMean            
tBodyGyroMag-std()	tBodyGyroMagStd	 averagetBodyGyroMagStd             
tBodyGyroJerkMag-mean()	tBodyGyroJerkMagMean	 averagetBodyGyroJerkMagMean        
tBodyGyroJerkMag-std()	tBodyGyroJerkMagStd	 averagetBodyGyroJerkMagStd         
fBodyAcc-mean()-X	fBodyAccMeanX	 averagefBodyAccMeanX               
fBodyAcc-mean()-Y	fBodyAccMeanY	 averagefBodyAccMeanY               
fBodyAcc-mean()-Z	fBodyAccMeanZ	 averagefBodyAccMeanZ               
fBodyAcc-std()-X	fBodyAccStdX	 averagefBodyAccStdX                
fBodyAcc-std()-Y	fBodyAccStdY	 averagefBodyAccStdY                
fBodyAcc-std()-Z	fBodyAccStdZ	 averagefBodyAccStdZ                
fBodyAcc-meanFreq()-X	fBodyAccMeanFreqX	 averagefBodyAccMeanFreqX           
fBodyAcc-meanFreq()-Y	fBodyAccMeanFreqY	 averagefBodyAccMeanFreqY           
fBodyAcc-meanFreq()-Z	fBodyAccMeanFreqZ	 averagefBodyAccMeanFreqZ           
fBodyAccJerk-mean()-X	fBodyAccJerkMeanX	 averagefBodyAccJerkMeanX           
fBodyAccJerk-mean()-Y	fBodyAccJerkMeanY	 averagefBodyAccJerkMeanY           
fBodyAccJerk-mean()-Z	fBodyAccJerkMeanZ	 averagefBodyAccJerkMeanZ           
fBodyAccJerk-std()-X	fBodyAccJerkStdX	 averagefBodyAccJerkStdX            
fBodyAccJerk-std()-Y	fBodyAccJerkStdY	 averagefBodyAccJerkStdY            
fBodyAccJerk-std()-Z	fBodyAccJerkStdZ	 averagefBodyAccJerkStdZ            
fBodyAccJerk-meanFreq()-X	fBodyAccJerkMeanFreqX	 averagefBodyAccJerkMeanFreqX       
fBodyAccJerk-meanFreq()-Y	fBodyAccJerkMeanFreqY	 averagefBodyAccJerkMeanFreqY       
fBodyAccJerk-meanFreq()-Z	fBodyAccJerkMeanFreqZ	 averagefBodyAccJerkMeanFreqZ       
fBodyGyro-mean()-X	fBodyGyroMeanX	 averagefBodyGyroMeanX              
fBodyGyro-mean()-Y	fBodyGyroMeanY	 averagefBodyGyroMeanY              
fBodyGyro-mean()-Z	fBodyGyroMeanZ	 averagefBodyGyroMeanZ              
fBodyGyro-std()-X	fBodyGyroStdX	 averagefBodyGyroStdX               
fBodyGyro-std()-Y	fBodyGyroStdY	 averagefBodyGyroStdY               
fBodyGyro-std()-Z	fBodyGyroStdZ	 averagefBodyGyroStdZ               
fBodyGyro-meanFreq()-X	fBodyGyroMeanFreqX	 averagefBodyGyroMeanFreqX          
fBodyGyro-meanFreq()-Y	fBodyGyroMeanFreqY	 averagefBodyGyroMeanFreqY          
fBodyGyro-meanFreq()-Z	fBodyGyroMeanFreqZ	 averagefBodyGyroMeanFreqZ          
fBodyAccMag-mean()	fBodyAccMagMean	 averagefBodyAccMagMean             
fBodyAccMag-std()	fBodyAccMagStd	 averagefBodyAccMagStd              
fBodyAccMag-meanFreq()	fBodyAccMagMeanFreq	 averagefBodyAccMagMeanFreq         
fBodyBodyAccJerkMag-mean()	fBodyBodyAccJerkMagMean	 averagefBodyBodyAccJerkMagMean     
fBodyBodyAccJerkMag-std()	fBodyBodyAccJerkMagStd	 averagefBodyBodyAccJerkMagStd      
fBodyBodyAccJerkMag-meanFreq()	fBodyBodyAccJerkMagMeanFreq	 averagefBodyBodyAccJerkMagMeanFreq 
fBodyBodyGyroMag-mean()	fBodyBodyGyroMagMean	 averagefBodyBodyGyroMagMean        
fBodyBodyGyroMag-std()	fBodyBodyGyroMagStd	 averagefBodyBodyGyroMagStd         
fBodyBodyGyroMag-meanFreq()	fBodyBodyGyroMagMeanFreq	 averagefBodyBodyGyroMagMeanFreq    
fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMagMean	 averagefBodyBodyGyroJerkMagMean    
fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMagStd	 averagefBodyBodyGyroJerkMagStd     
fBodyBodyGyroJerkMag-meanFreq()	fBodyBodyGyroJerkMagMeanFreq	 averagefBodyBodyGyroJerkMagMeanFreq
