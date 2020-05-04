# Import Webpage from URL.
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
wp <- read_html(url)

# Use the html_nodes() function and the table node type to extract the first table.
nodes <- html_nodes(wp,"table")


# We can see the content of each one using the html_text() function.
html_text(nodes[[8]])

# If the content of this object is an html table, we can use the html_table() function to convert it to a data frame.
html_table(nodes[[8]])

# You will analyze the tables from this HTML page over questions 1-3.

# Question 1
# Many tables on this page are team payroll tables, with columns for rank, team, and one or more money values.
# Convert the first four tables in nodes to data frames and inspect them.
# Which of the first four nodes are tables of team payroll?
tab1 <- html_table(nodes[[1]])
tab1
tab2 <- html_table(nodes[[2]])
tab2
tab3 <- html_table(nodes[[3]])
tab3
tab4 <- html_table(nodes[[4]])
tab4

Answer: table 2 3 and 4.

# Question 2
# For the last 3 components of nodes, which of the following are true? (Check all correct answers.)
html_table(nodes[[length(nodes) - 2]])
html_table(nodes[[length(nodes) - 1]])
html_table(nodes[[length(nodes)]])

All three entries are tables.
The last entry shows the average across all teams through time, not payroll per team.

# Question 3
# Create a table called tab_1 using entry 10 of nodes.
tab_1 <- html_table(nodes[[10]])
tab_1
# Create a table called tab_2 using entry 19 of nodes.
tab_2 <- html_table(nodes[[19]])
tab_2

# Note that the column names should be c("Team", "Payroll", "Average").
# You can see that these column names are actually in the first data row of each table,
# and that tab_1 has an extra first column No. that should be removed so that the column names for both tables match.
# Remove the extra column in tab_1, remove the first row of each dataset, and change the column names for each table to c("Team", "Payroll", "Average"). 
names(tab_1) <- tab_1 %>% slice(1) %>% unlist()
tab_1 <- tab_1 %>% slice(-1) %>% dplyr::select(Team,Payroll,Average)
head(tab_1)
nrow(tab_1)

names(tab_2) <- tab_2 %>% slice(1) %>% unlist()
tab_2 <- tab_2 %>% slice(-1) %>% dplyr::select(Team,Payroll,Average)
head(tab_2)
nrow(tab_2)

# Use a full_join() by the Team to combine these two tables.
tab_3 <- full_join(tab_1,tab_2,by = "Team")
head(tab_3)

# How many rows are in the joined data table?
nrow(tab_3)