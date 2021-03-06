# Question 1
# In the video, we use the function not_inches to identify heights that were incorrectly entered
not_inches <- function(x, smallest = 50, tallest = 84) {
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest 
  ind
}
# In this function, what TWO types of values are identified as not being correctly formatted in inches?
Values that result in NA’s when converted to numeric
Values less than 50 inches or greater than 84 inches

# Question 2
# Which of the following arguments, when passed to the function not_inches(), would return the vector c(FALSE)?
not_inches(c(70))

# Question 3
# Our function not_inches() returns the object ind. Which answer correctly describes ind?
ind is a logical vector of TRUE and FALSE, equal in length to the vector x (in the arguments list). TRUE indicates that a height entry is incorrectly formatted.

# Question 4
# Given the following code
s <- c("70","5 ft","4'11","",".","Six feet")
# What pattern vector yields the following result?
str_view_all(s, pattern)
70
5 ft
4’11
.
Six feet

str_view(s,"\\d|ft")

# Question 5
# You enter the following set of commands into your R console. What is your printed result?
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[a-z]"
str_detect(animals, pattern)    # Look for at least one lowercase character at the end of the string.

TRUE  TRUE  TRUE FALSE

# Question 6
# You enter the following set of commands into your R console. What is your printed result?
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[A-Z]$"
str_detect(animals, pattern)    # Look for uppercase character at the end of the string.

FALSE FALSE FALSE  TRUE

# Question 7
# You enter the following set of commands into your R console. What is your printed result?
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[a-z]{4,5}"
str_detect(animals, pattern)    # Look for either 4 or 5 lowercase letters in a row anywhere in the string.

FALSE  TRUE  TRUE FALSE

# Question 8
# Given the following code:
animals <- c("moose", "monkey", "meerkat", "mountain lion")

# Which TWO “pattern” vectors would yield the following result?
[1] TRUE TRUE TRUE TRUE

pattern <- "mo*"                # Matches at least zero times.
str_detect(animals, pattern)

pattern <- "mo?"                # Matches at most one time.
str_detect(animals, pattern)

# Question 9
# You are working on some data from different universities. You have the following vector:
schools <- c("U. Kentucky","Univ New Hampshire","Univ. of Massachusetts","University Georgia","U California","California State University")

# You want to clean this data to match the full names of each university:
> final
[1] "University of Kentucky"      "University of New Hampshire" "University of Massachusetts" "University of Georgia"         
[5] "University of California"    "California State University"

# What of the following commands could accomplish this?
schools %>% 
  str_replace("^Univ\\.?\\s|^U\\.?\\s", "University ") %>% 
  str_replace("^University of |^University ", "University of ")

# Question 10
# Rather than using the pattern_with_groups vector from the video, you accidentally write in the following code:
problems <- c("5.3", "5,5", "6 1", "5 .11", "5, 12")
pattern_with_groups <- "^([4-7])[,\\.](\\d*)$"
str_replace(problems, pattern_with_groups, "\\1'\\2")

# What is your result?
[1] "5'3"   "5'5"   "6 1"   "5 .11" "5, 12"

# Questoin 11
# You notice your mistake and correct your pattern regex to the following
problems <- c("5.3", "5,5", "6 1", "5 .11", "5, 12")
pattern_with_groups <- "^([4-7])[,\\.\\s](\\d*)$"
str_replace(problems, pattern_with_groups, "\\1'\\2")

# What is your result?
[1] "5'3"   "5'5"   "6'1"   "5 .11" "5, 12"

# Question 12
# Which answer best describes the differences between the regex string we use as an argument in 
str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")
# and the regex string in
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"?

The regex used in str_replace() looks for either a comma, period or space between the feet and inches digits,
while the pattern regex just looks for an apostrophe;
the regex in str_replace allows for none or more digits to be entered as inches,
while the pattern regex only allows for one or two digits.

# Question 13
# You notice a few entries that are not being properly converted using your str_replace() and str_detect() code:
yes <- c("5 feet 7inches", “5 7”)
no <- c("5ft 9 inches", "5 ft 9 inches")
s <- c(yes, no)

converted <- s %>% 
  str_replace("feet|foot|ft", "'") %>% 
  str_replace("inches|in|''|\"", "") %>% 
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")

pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
str_detect(converted, pattern)

# It seems like the problem may be due to spaces around the words feet|foot|ft and inches|in. What is another way you could fix this problem?

converted <- s %>% 
  str_replace("\\s*(feet|foot|ft)\\s*", "'") %>% 
  str_replace("\\s*(inches|in|''|\")\\s*", "") %>% 
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")

pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
str_detect(converted, pattern)
