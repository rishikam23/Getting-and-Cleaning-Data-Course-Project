# Code Book for Tidy Dataset

## Data Source
- The original dataset is from the UCI HAR Dataset, available at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Variables
- `subject`: Identifier for each subject (1 to 30).
- `activity_name`: Descriptive activity names (e.g., WALKING, SITTING).
- Mean and standard deviation variables, e.g., `TimeBodyAccelerometerMeanX`, `FrequencyBodyGyroscopeSTDZ`, etc.

## Data Processing
1. Merged datasets (training and test).
2. Filtered to retain mean and standard deviation measurements.
3. Assigned descriptive activity labels and variable names.
4. Calculated the mean of each variable for each activity and subject.

## Units
- All measurements are in standard units as provided in the original dataset (e.g., gravitational units for accelerometer data).
