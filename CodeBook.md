# Code Book

The input data for run_analysis.R is the UCI HAR Dataset collected with the Sambusn Galaxy S II smartphone.
Each variable (or feature) in the new ouput dataset is the mean of the input data for each subject and activity.
Only variables that are the mean or std of the input data set are kept.  Features are normalized
and bounded within the range [-1,1].  For gyroscopic measurements, the units are radians/sec, and for accelerometer
measurements, the units are standard g.  For more information, see the README.txt file in the UCS HAR dataset.
