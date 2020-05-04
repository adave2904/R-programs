library(dslabs)
library(lubridate)
options(digits = 3)

# Question 1
# Which of the following is the standard ISO 8601 format for dates?
YYYY-MM-DD

# Question 2
# Which of the following commands could convert this string into the correct date format?
dates <- c("09-01-02", "01-12-07", "02-03-04")

It is impossible to know which format is correct without additional information.

# Question 3
# Load the brexit_polls data frame from dslabs:
data(brexit_polls)
# How many polls had a start date (startdate) in April (month number 4)?
sum(month(brexit_polls$startdate) == 4)

# Use the round_date() function on the enddate column with the argument unit="week".
# How many polls ended the week of 2016-06-12?
  
brexit_polls %>%
filter(round_date(brexit_polls$enddate,unit = "week") == "2016-06-12") %>% nrow
x <- c("2020-05-01")
round_date(ymd("2020-05-01"),unit = "week")
weekdays(ymd("2020-05-01"))

# Question 4
# Use the weekdays() function from lubridate to determine the weekday on which each poll ended (enddate).
# On which weekday did the greatest number of polls end?
table(weekdays(brexit_polls$enddate))

# Question 5
#Load the movielens data frame from dslabs.
data(movielens)

# This data frame contains a set of about 100,000 movie reviews.
# The timestamp column contains the review date as the number of seconds since 1970-01-01 (epoch time).
# Convert the timestamp column to dates using the lubridate as_datetime() function.
movie_time <- as_datetime(movielens$timestamp)
movie_time %>% head

# Which year had the most movie reviews?
table(year(movie_time)) # 2000 - 13869

# Which hour of the day had the most movie reviews?
table(hour(movie_time)) # 20 - 7011


  
  