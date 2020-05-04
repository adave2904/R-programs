# Web Scraping : Process of extracting data from a web page.

# Import a webpage into R.
library(rvest)
url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
h <- read_html(url)

class(h)    # xml_document

# Extract the table node from h.
tab <- h %>% html_nodes("table")

# Extract the class wikitable sortable from the above table node.
tab <- tab[[2]]
class(tab)      # xml_nodeset

# Convert the xml_nodeset object to a data frame.
tab <- tab %>% html_table()
class(tab)
tab

# Change column names for the columns which are long.
colnames(tab)
tab <- tab %>% setNames(c("state", "population", "total", "murders", "gun_murders", "gun_ownership", "total_rate", "murder_rate", "gun_murder_rate"))
head(tab)
