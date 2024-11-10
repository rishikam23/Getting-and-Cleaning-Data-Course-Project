# Getting and Cleaning Data Project

This project contains an analysis script that processes the UCI HAR Dataset to produce a tidy dataset summarizing average measurements.

## Files
- run_analysis.R: R script that performs the data processing and analysis.
- tidy_data.txt: Output tidy dataset containing averages of each variable for each activity and each subject.
- CodeBook.md: Code book describing the variables, data processing, and transformations.
- README.md: This file provides an overview of the analysis and file descriptions.

## Analysis Summary
The `run_analysis.R` script performs the following:
1. Merges training and test datasets.
2. Extracts mean and standard deviation measurements.
3. Labels activities with descriptive names.
4. Appropriately labels variables with descriptive names.
5. Creates a tidy data set with the average of each variable for each activity and each subject.
