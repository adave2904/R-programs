# Import the murders data from the Wikipedia page.
url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
murders_raw <- read_html(url)

# Extract the tables from the raw data.
murders_raw <- murders_raw %>% html_nodes("table")
murders_raw

# Extract the class wikitable sortable from the above table node.
murders_raw <- murders_raw[[2]]
murders_raw

# Convert the xml_nodeset object to a data frame.
murders_raw <- murders_raw %>% html_table()
murders_raw
# Change column names for the columns which are long.
colnames(murders_raw)
murders_raw <- murders_raw %>% setNames(c("state", "population", "total", "murders", "gun_murders", "gun_ownership", "total_rate", "murder_rate", "gun_murder_rate"))


class(murders_raw$population)   # character instead of number
class(murders_raw$total)   # character instead of number

# Convert the columns population and total into number from character.
# First, need to check which columns have commas in the values.
commas <- function(x) any(str_detect(x, ","))
murders_raw %>% summarize_all(funs(commas))

# Replace commas with no spaces in the population column.
test_1 <- str_replace_all(murders_raw$population,",","")
# Convert test_1 from character to numeric.
test_1 <- as.numeric(test_1)
# Check the class of test_1.
class(test_1)

# parse_number also removes non-numeric characters from a character string.
test_2 <- parse_number(murders_raw$population)
class(test_2)

# Remove non-numeric characters from columns population and total.
murders_raw <- murders_raw %>% mutate_at(2:3, parse_number)
head(murders_raw)