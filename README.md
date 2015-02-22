# GACDP
Getting and Cleaning Data Project.  For the Coursera class.

Briefly: The run_analysis.R script will load the Samsung data, 
label each row with the subject and activity, merge the test and train datasets, 
select only the variables with either 'mean' or 'std' in the name, 
take the average for each subject and activity, and output a new tidy data set.

## Data Set Description

The input data for run_analysis.R is the UCI HAR Dataset collected with the Sambusn Galaxy S II smartphone.
Each variable (or feature) in the new ouput dataset is the mean of the input data for each subject and activity.  
Activity has been transformed from the number form to the descriptive text form.  
Features are normalized
and bounded within the range [-1,1].  For gyroscopic measurements, the units are radians/sec, and for accelerometer
measurements, the units are standard g.  For more information, see the README.txt file in the UCS HAR dataset.
