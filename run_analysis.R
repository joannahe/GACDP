
## import descriptions
labels         <- read.table('UCI HAR Dataset/features.txt',stringsAsFactors=F)        # column names of X_test and X_train
activity       <- read.table('UCI HAR Dataset/activity_labels.txt',stringsAsFactors=F) # activity labels (duh)

# import the activity for each row of the dataset
test_activity  <- read.table('UCI HAR Dataset/test/y_test.txt')     # activity of row in X_test
train_activity <- read.table('UCI HAR Dataset/train/y_train.txt')   # activity of row in X_train
total_activity <- rbind( test_activity, train_activity )      # merge the test and train activity rows
colnames(total_activity) <- 'activity'                        # apply a decriptive column name

# import the subject for each row of the data set
test_subjects  <- read.table('UCI HAR Dataset/test/subject_test.txt')    # subjects for each row of test data set
train_subjects <- read.table('UCI HAR Dataset/train/subject_train.txt')  # subjects for each row of train data set
total_subjects <- rbind( test_subjects, train_subjects )      # merge the test and train subject rows
colnames(total_subjects) <- 'subject'                         # apply a descriptive column name

# import the actual data set (it's big, it'll take a bit)
test           <- read.table('UCI HAR Dataset/test/X_test.txt')
train          <- read.table('UCI HAR Dataset/train/X_train.txt') 
total <- rbind(test,train)    # merge the test and train data sets
colnames(total) <- labels[,2] # apply descriptive names

# pick out the columns that we care about, mean and std
selcols <- (grepl('mean',colnames(total),ignore.case=T) | grepl('std',colnames(total),ignore.case=T))
total.selected <- total[,selcols]

# add the columns for the subject and activity
total.all.columns <- cbind(total_activity, total_subjects, total.selected)

# change the activity number to an descriptive activity string
for (i in activity[,1]) {
    total.all.columns$activity <- sub(i,activity[i,2],total.all.columns$activity)
}

# make a new data set that is the mean of each variable for each subject and activity (easy, right?!)
newdataset <- aggregate( total.all.columns[,3:length(total.all.columns)], list(subject = total.all.columns$subject, activity = total.all.columns$activity), mean )

## output the results for upload
write.table(newdataset,"output.txt",row.names=F)
