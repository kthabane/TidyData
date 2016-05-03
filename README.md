# TidyData

##Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Script Analysis

The script performs the following steps (output from actual program):
[1] "STEP 1 : Load required packages - completed" \t
[1] "STEP 2: Declare/setup all constant variables - completed"
[1] "STEP 3: Download Zip File and Unzip - completed"
[1] "STEP 4: Load features files and extract all 'mean' and 'std' pieces -completed"
[1] "STEP 5: Load all train and test data sets from the 'X','Y' and 'Subject' files - completed"
[1] "STEP 6: Aggregate all train and test data together,then put descriptive labels -completed"
[1] "STEP 7: Convert the dataset into a factor data type -completed"
[1] "STEP 8: Compute the mean for all variables and write out to output -completed"
[1] "STEP 9: Remove the originally downloaded zip file and the unzipped folder -completed"
[1] "STEP 10: ALL steps completed."

##Execution process

Here are the steps to execute the program:
1.source("run_analysis.R")
2.run_analysis()
