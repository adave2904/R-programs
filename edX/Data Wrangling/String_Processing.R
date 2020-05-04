# The most common tasks in string processing include:
#     extracting numbers from strings
#     removing unwanted characters from text
#     finding and replacing characters
#     extracting specific parts of strings
#     converting free form text to more uniform formats
#     splitting strings into multiple values.

# To include a double quote in a string, surround the string by single quotes.
s <- '10"'
cat(s)

# To include a single quote in a string, surround the string by double quotes.
a <- "5'"
cat(a)

# Escape characters needs to be used when a string contains both single and double quotes.
s <- '5\'10"'
cat(s)

s <- "5'10\""
cat(s)

# Check which string classifies as a pattern.
yes <- c("180 cm","70 inches")
no <- c("180","70''")
s <- c(yes,no)

# Which of the above strings includes the pattern cm or inches.
str_detect(s,"cm") | str_detect(s,"inches")
# Using a regular expression.
str_detect(s,"cm|inches")

# Check if a string has digits in it.
yes <- c("5","6","5'10","5 feet","4'11")
no <- c("",".","Five","Six")
s <- c(yes,no)

# Find the first match for the pattern //d.
str_view(s,"//d")

# Find all matches for the pattern //d.
str_view_all(s,"//d")

# Character classes : a group of characters that can be matched.
str_view(s,"[56]")   # Matches the first digit in the string to be either 5 or 6. [56] is the character class.

# Match values between 4 and 7.
str_view(s,"[4-7]")

# Match when there is only one digit.
# ^ - beginning of the string.
# $ - end of the string.
pattern <- "^\\d$"
yes <- c("1", "5", "9")
no <- c("12", "123", " 1", "a4", "b")
s <- c(yes, no)

str_view(s,pattern)

# Match when there are either one or two digits.
# {n} - exactly n times.
# {n,} - at least n times.
# {,n} - at most n times.
# {n,m} - between n and m times.

pattern <- "^\\d{1,2}$"
yes <- c("1", "5", "9", "12")
no <- c("123", "a4", "b")
str_view(c(yes, no), pattern)

# pattern x feet and y inches.
pattern <- "^[4-7]'\\d{1,2}\"$"
# The string starts with any number between 4 and 7.
# Followed by ' (feet symbol).
# Followed by 1 or 2 digits (\\d{1,2).
# Followed by " (inches symbol) and the string ends.
yes <- c("5'7\"", "6'2\"",  "5'12\"")
no <- c("6,2\"", "6.2\"","I am 5'11\"", "3'2\"", "64")

str_detect(yes,pattern)
str_detect(no,pattern)

# Zero or more instances of a certain character in a string.
# * - zero or more instances.
# + - at least one instance.
# ? - at most one instance.
yes <- c("AB", "A1B", "A11B", "A111B", "A1111B")
no <- c("A2B", "A21B")
str_detect(yes, "A1*B")     # Check if there are zero or more instances of the character 1 in the string yes.
str_detect(no, "A1*B")

str_detect(yes, "A1+B")     # Check if there is at least one instance of the character 1 in the string yes.
str_detect(no, "A1+B")

str_detect(yes, "A1?B")     # Check if there is at least one instance of the character 1 in the string yes.
str_detect(no, "A1?B")

# Groups
pattern_without_groups <- "^[4-7],\\d*$"
pattern_with_groups <- "^([4-7]),(\\d*)$"

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187  ", "482 952 3315",
             "239 923 8115 and 842 566 4692", "Work: 579-499-7527", "$1000",
             "Home: 543.355.3679")
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"

# Look for each group presence in the string.
str_match(strings,phone)

# Look for the entire pattern in the string.
str_extract(strings,phone)

# Replace the groups.
## \\i - ith group. eg. \\1 - value extracted from the first group.

# Replace comma with a quote (') when the comma is between two digits.
yes <- c("5,9", "5,11", "6,", "6,1")
no <- c("5'9", ",", "2,8", "6.1.1")
s <- c(yes, no)

str_replace(s,pattern_with_groups,"\\1'\\2")


# Extract function converts each group in a regex into a column.
s <- c("5'10","6'1")
tab <- data.frame(x = s)
tab

# Separate function.
tab %>% separate(x,c("feet","inches"),sep = "'")
# Using regex.
tab %>% extract(x,c("feet","inches"),regex = "(\\d)'(\\d{1,2})")

# Another example.
s <- c("5'10","6'1\"","5'8inches")
tab <- data.frame(x = s)
tab

tab %>% separate(x,c("feet","inches"),sep = "'") # Does not work.

tab %>% extract(x,c("feet","inches"),regex = "(\\d)'(\\d{1,2})")

# Splitting Strings.

filename <- system.file("extdata/murders.csv",package = "dslabs")
lines <- readLines(filename)
lines %>% head

# Split each line at comma.
x <- str_split(lines,",")
x %>% head
# First Line is column name. Remove the row.
col_names <- x[[1]]
x <- x[-1]

# Extract the first element of each entry.
map(x,1) %>% head()

# Extract columns 1-5 as characters and create a data frame.
dat <- data.frame(parse_guess(map_chr(x,1)),
                  parse_guess(map_chr(x,2)),
                  parse_guess(map_chr(x,3)),
                  parse_guess(map_chr(x,4)),
                  parse_guess(map_chr(x,5))
      ) %>% 
  setNames(col_names)

dat %>% head

# Alternate way
x <- str_split(lines,",",simplify = TRUE)
col_names <- x[1,]
x <- x[-1,]

x %>% as_data_frame() %>%
  setNames(col_names) %>%
  mutate_all(parse_guess)


## Recoding -- changing column names for display purposes.
library(dslabs)
data("gapminder")

# Time Series Graph for Carribean countries.
gapminder %>% 
  filter(region == "Caribbean") %>%
  ggplot(aes(year,life_expectancy,color = country)) + geom_line()

# The country names are too long.
gapminder %>% 
  filter(region == "Caribbean") %>%
  filter(str_length(country) >= 12) %>%
  distinct(country)
# Recode country names and make the plot.
gapminder %>% 
  filter(region == "Caribbean") %>%
  mutate(country = recode(country,
                          'Antigua and Barbuda'="Barbuda",
                          'Dominican Republic' = "DR",
                          'St. Vincent and the Grenadines' = "St. Vincent",
                          'Trinidad and Tobago' = "Trinidad")) %>%
  ggplot(aes(year,life_expectancy,color = country)) + geom_line()




