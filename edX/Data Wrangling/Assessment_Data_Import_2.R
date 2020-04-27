# Question 14
# Inspect the file at the following URL:
# http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data
# Which readr function should be used to import this file?
read_csv()

# Question 15
# Check the documentation for the readr function you chose in the previous question to learn about its arguments.
# Determine which arguments you need to the file from the previous question:
# url <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
# Does this file have a header row? Does the readr function you chose need any additional arguments to import the data correctly?
url <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
download.file(url,"wdbc.data")
data5 <- read_csv("wdbc.data",col_names = FALSE)
data5

No, there is no header. The col_names=FALSE argument is necessary.

# Question 16
# Inspect the imported data from the previous question.
# How many rows are in the dataset?
nrow(data5)
# How many columns are in the dataset?
ncol(data5)