# readr - A library that includes functions for reading data stored in text file spreadsheets into R.
# readxl - A library that includes functions for reading data stored in xls or xlsx spreadsheets into R.
library(readr)
library(readxl)

# Read 3 lines from the file murder.csv
read_lines("murders.csv",n_max = 3)

# Read murders.csv file into R.
data <- read_csv("murders.csv")
class(data)

# Get top rows of the file.
head(data)

# Import murders.csv into R using R-based functions.
data1 <- read.csv("murders.csv")
class(data1$abb)    #factor.
# Import murders.csv into R using R-based functions. Store the columns not as factor.
data1 <- read.csv("murders.csv",stringsAsFactors = FALSE)
class(data1)