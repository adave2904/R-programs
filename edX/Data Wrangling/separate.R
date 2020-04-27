# Import the wide data file life-expectancy-and-fertility-two-countries-example.csv into R.
# This file contains two variables -- life expectancy and fertility.
path <- system.file("extdata",package = "dslabs")
filename <- file.path(path,"life-expectancy-and-fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
select(wide_data,1:5)

# Gather all columns except country. Since there are two variables, the column name will be key.
data <- wide_data %>% gather(key,value,-country,convert = TRUE)
head(data)

# Need to separate the key column into year and variable type (fertility,life expectancy).
sep_data <- data %>% separate(key,c("year","variable"),"_")
head(sep_data)

# Here, life_expectancy is split into life and expectancy as _ is the separator specified and there are extra variables in sep_data.
# The argument extra can be used in this scenario.
sep_data <- data %>% separate(key,c("year","variable"),"_",extra = "merge")
head(sep_data)

# Create a new column for each variable (fertility,life expectancy).
tidy_data <- sep_data %>% spread(variable,value)

?separate
