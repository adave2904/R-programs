# Data for election forecasting is available in two tables.
# 1. murders
# 2. results_us_election_2016.

head(murders)
head(results_us_election_2016)

# Check if the column order in both tables is same.
identical(results_us_election_2016,murders)

# Join the tables murders and results_us_election_2016 using left_join.
tab <- left_join(murders,results_us_election_2016,by = "state")
head(tab)
# Plot the relationship between the population and the electoral votes.
tab %>% ggplot(aes(population/(10^6),electoral_votes,label = abb)) +
  geom_point() +
  geom_text_repel() +
  scale_x_continuous(trans = "log2") +
  scale_y_continuous(trans = "log2") +
  geom_smooth(method = "lm",se = FALSE)

# From the murders table, create a subset with first 6 rows and columns state and population.
tab1 <- murders %>% slice(1:6) %>% dplyr::select(state,population)
tab1
# From the results_us_election_2016 table, create a subset with first 3, 5th, 7th and 8th rows. and columns state and electoral_votes
tab2 <- results_us_election_2016 %>% slice(c(1:3,5,7:8)) %>% select(state,electoral_votes)
tab2

# Add the column electoral_votes from tab2 to tab1.
left_join(tab1,tab2,by = "state")
# Since only California is the matching state, electoral_votes value is available from tab_2.
# For all other states, electoral_votes is defaulted to NA.

# Add the column populatoin from tab1 to tab2.
tab1 %>% right_join(tab2, by = "state")
# Since only California is the matching state, population value is available from tab_1.
# For all other states, population defaulted to NA.

# Join the two tables tab1 and tab2 and keep only the matching rows.
inner_join(tab1,tab2,by = "state")

# Keep all the rows and fill the missing parts as NA.
full_join(tab1,tab2,by = "state")

# Keep all the columns of tab1 depending on the availability in tab2.
semi_join(tab1,tab2,by = "state")

# Retrieve non-matching data only from tab1.
anti_join(tab1,tab2,by = "state")



