# GettingAndCleaningData
Coursera repository for Getting And Cleaning Data course

Created by Krzysztof Grajek

All the scripts contained whithin that repository are a result of the programming assignment needed to be done
for 'Getting And Cleaning Data' course run at Coursera.org

Please read CodeBook.md found in this repository for more details about the scripts created, the purpose as well as the description of the resulting datasets created.

You can also have a look into comments and code inside 'run_analysis.R' script for more details on how the resulting dataset is created.

## Description of 'run_analysis.R' script

The script for performing all the cleaning operations were created using the number of more or less specialized functions to clean up the data step by step.
The scripts executes a number of operations described below:

1. Load all necessary libraries like 'dplyr' and 'stringr'
  * 'dplyr' is used in many places mostly to select appropriate columns or execute group by operations
  * 'stringr' is used to transform variable names into more human readable form easily

2. The data is loaded into R from multiple files and merge together, only the 'mean' and 'std' columns are selected.

3. The activities which are originally represented by numbers are transformed into factor with names found in a separate file.

4. The column names with measurements get renamed to a human readable form using the strings found in a separate file.

5. All the functions are run together (sequentially) using a wrapper function called 'run()' which is being called at the end of the script file.

6. The 'run()' function saves the the datasets described above into a files stored in the current working directory.
