# Exercise 1. Distribution of female heights - 1
# Assume the distribution of female heights is approximated by a normal distribution with a mean of 64 inches and a standard deviation of 3 inches.
# If we pick a female at random, what is the probability that she is 5 feet or shorter?
# Assign a variable 'female_avg' as the average female height.
female_avg <- 64

# Assign a variable 'female_sd' as the standard deviation for female heights.
female_sd <- 3

# Using variables 'female_avg' and 'female_sd', calculate the probability that a randomly selected female is shorter than 5 feet. Print this value to the console.
pnorm(5*12,female_avg,female_sd)

# Exercise 2. Distribution of female heights - 2
# If we pick a female at random, what is the probability that she is 6 feet or taller?
1 - pnorm(6*12,female_avg,female_sd)

# Exercise 3. Distribution of female heights - 3
# If we pick a female at random, what is the probability that she is between 61 and 67 inches?
pnorm(67,female_avg,female_sd) - pnorm(61,female_avg,female_sd)

# Exercise 4. Distribution of female heights - 4
# Repeat the previous exercise, but convert everything to centimeters.
# That is, multiply every height, including the standard deviation, by 2.54. What is the answer now?
female_avg <- female_avg * 2.54
female_sd <- female_sd * 2.54

pnorm(67*2.54,female_avg,female_sd) - pnorm(61*2.54,female_avg,female_sd)

# Exercise 5. Probability of 1 SD from average
# Compute the probability that the height of a randomly chosen female is within 1 SD from the average height.
taller <- female_avg + female_sd
taller

shorter <- female_avg - female_sd
shorter

pnorm(taller,female_avg,female_sd) - pnorm(shorter,female_avg,female_sd)

# Exercise 6. Distribution of male heights
# Imagine the distribution of male adults is approximately normal with an average of 69 inches and a standard deviation of 3 inches.
# How tall is a male in the 99th percentile?
male_avg <- 69
male_sd <- 3

qnorm(0.99,male_avg,male_sd)

# Exercise 7. Distribution of IQ scores
# The distribution of IQ scores is approximately normally distributed.
# The average is 100 and the standard deviation is 15.
# Suppose you want to know the distribution of the person with the highest IQ in your school district, where 10,000 people are born each year.
# Generate 10,000 IQ scores 1,000 times using a Monte Carlo simulation.
# Make a histogram of the highest IQ scores.

# The variable `B` specifies the number of times we want the simulation to run.
B <- 1000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation.
set.seed(1)

# Create an object called `highestIQ` that contains the highest IQ score from each random distribution of 10,000 people.
highestIQ <- replicate(B,{
  simulated_data <- rnorm(10000,100,15)
  + max(simulated_data)
}
)

# Make a histogram of the highest IQ scores.
hist(highestIQ)