# Question 1
# If you use the extract code from our video, the decimal point is dropped.
s <- c("5'10", "6'1\"", "5'8inches", "5'7.5")
tab <- data.frame(x = s)
# What modification of the code would allow you to put the decimals in a third column called “decimal”?
extract(data = tab, col = x, into = c("feet", "inches", "decimal"), 
        regex = "(\\d)'(\\d{1,2})(\\.\\d+)?")

# Question 2
# You have the following table, schedule:

# schedule
# day		staff
# Monday		Mandy, Chris and Laura
# Tuesday		Steve, Ruth and Frank
# You want to turn this into a more useful data frame.
# Which two commands would properly split the text in the “staff” column into each individual name?
# Select ALL that apply.
str_split(schedule$staff, ", | and ")
str_split(schedule$staff, ",\\s|\\sand\\s")

# Question 3
# You have the following table, schedule:
> schedule
day         staff
Monday   	Mandy, Chris and Laura
Tuesday 	Steve, Ruth and Frank

# What code would successfully turn your “Schedule” table into the following tidy table?
> tidy
day     staff
<chr>   <chr>
Monday  Mandy
Monday  Chris
Monday  Laura
Tuesday Steve
Tuesday Ruth 
Tuesday Frank

tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ")) %>% 
  unnest()

# Question 4
# Using the gapminder data, you want to recode countries longer than 12 letters in the region “Middle Africa” to their abbreviations in a new column, “country_short”.
# Which code would accomplish this?
gapminder %>%
  filter(region == "Middle Africa") %>%
  mutate(country_short = recode(country,
                                "Central African Republic" = "CAR", 
                                "Congo, Dem. Rep." = "DRC",
                                "Equatorial Guinea" = "Eq. Guinea"))


# Import raw Brexit data from wikipedia.
library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[5]] %>% html_table(fill = TRUE)

polls %>% head
# Question 5
# Some rows in this table do not contain polls.
# You can identify these by the lack of the percent sign (%) in the Remain column.
# Update polls by changing the column names to c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
# and only keeping rows that have a percent sign (%) in the remain column.
names(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
polls <- polls[str_detect(polls$remain,"%"),-9]

# How many rows remain in the polls data frame?
nrow(polls)


# Question 6
# The remain and leave columns are both given in the format "48.1%": percentages out of 100% with a percent symbol.
# Which of these commands converts the remain vector to a proportion between 0 and 1?
as.numeric(str_replace(polls$remain, "%", ""))/100

parse_number(polls$remain)/100

# Question 7
# The undecided column has some "N/A" values.
# These "N/A"s are only present when the remain and leave columns total 100%, so they should actually be zeros.
# Use a function from stringr to convert "N/A" in the undecided column to 0.
# The format of your command should be function_name(polls$undecided, "arg1", "arg2").

# What function replaces function_name?
str_replace_all
# What argument replaces arg1?
N/A
# What argument replaces arg2?
0

# Question 8
# The dates column contains the range of dates over which the poll was conducted.
# The format is "8-10 Jan" where the poll had a start date of 2016-01-08 and end date of 2016-01-10.
# Some polls go across month boundaries (16 May-12 June).
# The end date of the poll will always be one or two digits, followed by a space, followed by the month as one or more letters (either capital or lowercase).
# In these data, all month abbreviations or names have 3, 4 or 5 letters.
# Write a regular expression to extract the end day and month from dates.
# Insert it into the skeleton code below:
temp <- str_extract_all(polls$dates,"_______")
end_date <- sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
end_date %>% head(n = 20)
# Which of the following regular expressions correctly extracts the end day and month when inserted into the blank in the code above?
"\\d+\\s[a-zA-Z]+"
"[0-9]+\\s[a-zA-Z]+"
"\\d{1,2}\\s[a-zA-Z]+"
"\\d+\\s[a-zA-Z]{3,5}"

