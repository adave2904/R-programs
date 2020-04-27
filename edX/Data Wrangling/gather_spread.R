# From the gapminder dataset available in tidyverse library, fetch fertility data for Germany and South Korea.
data <- gapminder %>% filter(country %in% c("Germany","South Korea")) %>% select(country,year,fertility)
nrow(data)

# Plot the data.
data %>% ggplot(aes(year,fertility,color = country)) + geom_point()

# Import raw data for the above file into R.
path <- system.file("extdata",package = "dslabs")
list.files(path)
filename <- file.path(path,"fertility-two-countries-example.csv")
raw_data <- read_csv(filename)

# Fetch sample data from the raw data.
select(raw_data,country,`1960`:`1967`)

# Convert the raw data into tidy data using gather.
tidy_data <- raw_data %>% gather(year,fertility,`1960`:`2015`)

# Convert the data into tidy data by specifying what columns not to gather.
tidy_data <- raw_data %>% gather(year,fertility,-country)
head(tidy_data)

# Convert the data into tidy data by specifying what columns not to gather and also ensuring appropriate data types are assigned.
tidy_data <- raw_data %>% gather(year,fertility,-country,convert = TRUE)
class(tidy_data$year)

# Plot the tidy data.
tidy_data %>% ggplot(aes(fertility,year,color = country)) + geom_point()

# Convert tidy data to wide data using spread function.
wide_data <- tidy_data %>% spread(year,fertility)
head(wide_data)