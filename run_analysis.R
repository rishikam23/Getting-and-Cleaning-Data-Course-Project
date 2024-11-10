library(dplyr)
zip_url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file="UCI_HAR_Dataset.zip"

if(!file.exists(zip_file)) {
  download.file(zip_url,zip_file,mode="wb")
}
if(!file.exists("UCI HAR Dataset")){
  unzip(zip_file)
}

#Step 1: Merge the training and test sets to create one data set
f=read.table("UCI HAR Dataset/features.txt",col.names=c("index","feature_name"))
act=read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))

sub_train=read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")
x_train=read.table("UCI HAR Dataset/train/X_train.txt")
y_train=read.table("UCI HAR Dataset/train/y_train.txt",col.names="activity_id")

sub_test=read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")
x_test=read.table("UCI HAR Dataset/test/X_test.txt")
y_test=read.table("UCI HAR Dataset/test/y_test.txt",col.names="activity_id")

sub=rbind(sub_train,sub_test)
x_data=rbind(x_train,x_test)
y_data=rbind(y_train,y_test)

colnames(x_data)=f$feature_name
data=cbind(sub,y_data,x_data)
View(data)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
mean_std_cols=grep("-(mean|std)\\(\\)",f$feature_name)
d1=data[,c(1,2,mean_std_cols+2)]
View(d1)

# Step 3: Use descriptive activity names to name the activities in the data set
d1=merge(d1,act,by.x="activity_id",by.y="activity_id",all.x=TRUE)
View(d1)

# Step 4: Appropriately label the data set with descriptive variable names
names(d1)=gsub("^t","Time",names(d1))
names(d1)=gsub("^f","Frequency",names(d1))
names(d1)=gsub("Acc","Accelerometer",names(d1))
names(d1)=gsub("Gyro","Gyroscope",names(d1))
names(d1)=gsub("Mag","Magnitude",names(d1))
names(d1)=gsub("BodyBody","Body",names(d1))
names(d1)=gsub("-mean\\(\\)","Mean",names(d1))
names(d1)=gsub("-std\\(\\)","STD",names(d1))
names(d1)=gsub("-","",names(d1))
View(d1)

# Step 5: Create a second,independent tidy data set with the average of each variable for each activity and each subject
tidy_data=d1 %>%
  group_by(subject,activity_name) %>%
  summarise_all(function(x) mean(x,na.rm=TRUE))

write.table(tidy_data,"tidy_data.txt",row.names=FALSE)
View(tidy_data)
