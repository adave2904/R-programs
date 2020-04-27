# Question 1
# You have created data frames tab1 and tab2 of state population and election data, similar to our module videos:
# What are the dimensions of the table dat, created by the following command?
tab <- left_join(murders, results_us_election_2016, by = "state")
tab1 <- slice(murders, 1:5) %>% select(state, population)
tab2 <- slice(results_us_election_2016, c(1:3, 5, 7:8)) %>% select(state, electoral_votes)
dat <- left_join(tab1, tab2, by = "state")
dim(dat)

# Question 2
# We are still using the tab1 and tab2 tables shown in question 1.
# What join command would create a new table “dat” with three rows and two columns?
dat <- semi_join(tab1, tab2, by = “state”) 

# Question 3
# Which of the following are real differences between the join and bind functions?
Binding functions combine by position, while join functions match by variables.
Joining functions can join datasets of different dimensions, but the bind functions must match on the appropriate dimension (either same row or column numbers).
Bind functions can combine both vectors and dataframes, while join functions work for only for dataframes.

# Question 4
# We have two simple tables, shown below, with columns x and y:
final <- setdiff(df1, df2)
  
  