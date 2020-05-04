# The Wikipedia page on opinion polling for the Brexit referendum, in which the United Kingdom voted to leave the European Union in June 2016, contains several tables.
# One table contains the results of all polls regarding the referendum over 2016:
# Use the rvest library to read the HTML from this Wikipedia page.
library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
wp <- read_html(url)
class(wp)

# Question 4
# Assign tab to be the html nodes of the "table" class.
nodes <- wp %>% html_nodes("table")
class(nodes)

# How many tables are in this Wikipedia page?
length(nodes)

# Question 5
# Inspect the first several html tables using html_table() with the argument fill=TRUE (you can read about this argument in the documentation).
# Find the first table that has 9 columns with the first column named "Date(s) conducted".

html_table(nodes[[1]],fill = TRUE)
html_table(nodes[[2]],fill = TRUE)
html_table(nodes[[3]],fill = TRUE)
html_table(nodes[[4]],fill = TRUE)
html_table(nodes[[5]],fill = TRUE)


# What is the first table number to have 9 columns where the first column is named "Date(s) conducted"?
5