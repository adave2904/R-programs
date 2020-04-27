# Question 9
# Examine the built-in dataset co2. This dataset comes with base R, not dslabs - just type co2 to access the dataset.
co2 is not tidy: to be tidy we would have to wrangle it to have three columns (year, month and value), and then each co2 observation would have a row.

# Question 10
# Run the following command to define the co2_wide object:
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))
head(co2_wide)
# Use the gather() function to make this dataset tidy.
# Call the column with the CO2 measurements co2 and call the month column month.
# Name the resulting object co2_tidy.
# Which code would return the correct tidy format?
co2_tidy <- gather(co2_wide,month,co2,-year)

# Question 11
# Use co2_tidy to plot CO2 versus month with a different curve for each year:
co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()
# What can be concluded from this plot?
CO2 concentrations are highest around May and the yearly average increased from 1959 to 1997.

# Question 12
# Load the admissions dataset from dslabs, which contains college admission information for men and women across six majors, and remove the applicants percentage column:
library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)
# Your goal is to get the data in the shape that has one row for each major, like this:
# major  men   women
# A      62    82		
# B      63    68		
# C      37    34		
# D      33    35		
# E      28    24		
# F       6     7	
dat_tidy <- spread(dat,gender,admitted)
head(dat_tidy)

# Question 13
# Now use the admissions dataset to create the object tmp, which has columns major, gender, key and value:
tmp <- gather(admissions, key, value, admitted:applicants)
tmp

# Combine the key and gender and create a new column called column_name to get a variable with the following values:
# admitted_men, admitted_women, applicants_men and applicants_women. Save the new data as tmp2.
# Which command could help you to wrangle the data into the desired format?
tmp2 <- unite(tmp, column_name, c(key, gender))

# Question 14
# Which function can reshape tmp2 to a table with six rows and five columns named major, admitted_men, admitted_women, applicants_men and applicants_women?
spread()


  