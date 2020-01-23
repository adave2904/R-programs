#Import data from file into R.

#Method 1. Select the File manually.

dem_stats <- read.csv(file.choose())
dem_stats

#Method 2. Set working directory and get data.

#getwd() gives the current working directory path.
getwd()
#setwd() lets you set the working directory.
setwd("/Users/aarsh_dave/Desktop/R programs")

dem_stats <- read.csv("P5-Demographic-Data.csv")
dem_stats

####################### Exploring the Dataset #####################
nrow(dem_stats)     #No. of rows in the data set.
ncol(dem_stats)     #No. of columns in the data set.
head(dem_stats)     #Top 10 rows of the data set.
head(dem_stats,n = 20)  #Top 20 rows of the data set.
tail(dem_stats)     #Last 10 rows of the data set.
tail(dem_stats,n=5)     #last 5 rows of the data set.
str(dem_stats)      #structure of the data set.
summary(dem_stats)  #summaries of the data.


############## Using the $ sign #################
dem_stats[3,3]    #Print the value at 3rd row and 3rd column
dem_stats[3,"Birth.rate"] #Print the Birth.rate value at 3rd row

# $ sign is an alternate way to access data in a data frame. $ sign does not work for matrices.

dem_stats$Internet.users        #prints all values for the column Internet.users
dem_stats$Internet.users[2]     #prints Internet.users value for the second row.
dem_stats[,"Internet.users"]    #prints all values for the column Internet.users
levels(dem_stats$Income.Group)  #prints all distinct values of a column.


##############  Basic operations on a data frame ###############
dem_stats[1:10,]    #subsetting.
dem_stats[3:9,]
dem_stats[c(4,100),]

dem_stats[1,]     #When one row is extracted from a data frame, it is not converted to a vector. It remains a dataframe.
is.data.frame(dem_stats[1,]) #TRUE

dem_stats[,1]     #When one column is extracted from a data frame, the result is not a data frame
is.data.frame(dem_stats[,1]) #FALSE

dem_stats[,1,drop=FALSE]    #Ensures that the result is a data frame.
is.data.frame(dem_stats[,1,drop=FALSE]) #TRUE


dem_stats$Birth.rate * dem_stats$Internet.users   #Multiplies row wise and results into a vector.
 

#Add column to a data frame
dem_stats$Mycalc <- dem_stats$Birth.rate * dem_stats$Internet.users

str(dem_stats)

dem_stats$xyz <- 1:5    #The first five rows are assigned the values of the vector 1:5. Then the values are cycled.
head(dem_stats,n=10)

#Remove columns from a data frame
dem_stats$xyz <- NULL
head(dem_stats)

dem_stats$Mycalc <- NULL
head(dem_stats)

###################### Filtering Data Frames ###################

dem_stats$Internet.users < 2    #Gives a boolean vector with values FALSE where Internet User % >= 2 and TRUE where INternet Users < 2%.
filter_data <- dem_stats$Internet.users < 2 #stores the boolean values in a vector.
dem_stats[filter_data,]      #prints all records where filter_data = TRUE.

dem_stats[dem_stats$Birth.rate >= 40,]  #prints all records where Birth Rate >=40.

dem_stats[dem_stats$Birth.rate >= 40 & dem_stats$Internet.users < 2,]  #prints all records where Birth Rate >=40 and Internet Users < 2%.

dem_stats[dem_stats$Income.Group == "High income",] #prints all records where Income.group = "High income"
levels(dem_stats$Income.Group)

dem_stats[dem_stats$Country.Name == "Malta",] #prints all records where Country.Name = "Malta"