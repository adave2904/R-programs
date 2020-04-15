# Exercise 1. American Roulette probability of winning money
# The exercises in the previous chapter explored winnings in American roulette.
# In this chapter of exercises, we will continue with the roulette example and add in the Central Limit Theorem.
# In the previous chapter of exercises, you created a random variable S that is the sum of your winnings after betting on green a number of times in American Roulette.
# What is the probability that you end up winning money if you bet on green 100 times?

# The variables `green`, `black`, and `red` contain the number of pockets for each color
green <- 2
black <- 18
red <- 18

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- 2 / 38

# Assign a variable `p_not_green` as the probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# Define the number of bets using the variable 'n'
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
1 - pnorm(0,avg,se)

# Exercise 2. American Roulette Monte Carlo simulation
# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the sum of 100 bets.
# Compute the average and standard deviation of the resulting list and compare them to the expected value (-5.263158) and standard error (40.19344) for S that you calculated previously.

# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B,{
  X <- sample(c(17,-1),n,replace = TRUE,prob = c(p_green,p_not_green))
  sum(X)
})

# Compute the average value for 'S'
mean(S)

# Calculate the standard deviation of 'S'
sd(S)

# Exercise 3. American Roulette Monte Carlo vs CLT
# In this chapter, you calculated the probability of winning money in American roulette using the CLT.
# Now, calculate the probability of winning money from the Monte Carlo simulation. The Monte Carlo simulation from the previous exercise has already been pre-run for you, resulting in the variable S that contains a list of 10,000 simulated outcomes.

# Calculate the proportion of outcomes in the vector `S` that exceed $0
mean(S > 0)

# Exercise 4. American Roulette Monte Carlo vs CLT comparison
# The Monte Carlo result and the CLT approximation for the probability of losing money after 100 bets are close, but not that close. What could account for this?
  
The CLT does not work as well when the probability of success is small.

# Exercise 5. American Roulette average winnings per bet
# Now create a random variable Y that contains your average winnings per bet after betting on green 10,000 times.

# Define the number of bets using the variable 'n'
n <- 10000

# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(17,-1),n,replace = TRUE,prob = c(p_green,p_not_green))

# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X)
Y

# Exercise 6. American Roulette per bet expected value
# What is the expected value of Y, the average outcome per bet after betting on green 10,000 times?
((17 * p_green) + (-1 * p_not_green))

# Exercise 7. American Roulette per bet standard error
# What is the standard error of Y, the average result of 10,000 spins?

# Define the number of bets using the variable 'n'
n <- 10000

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 bets.
abs(17 - -1) * sqrt(p_green * p_not_green) / sqrt(n)

# Exercise 8. American Roulette winnings per game are positive
# What is the probability that your winnings are positive after betting on green 10,000 times?

# We defined the average using the following code
avg <- 17*p_green + -1*p_not_green

# We defined standard error using this equation
se <- 1/sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
1 - pnorm(0,avg,se)

# Exercise 9. American Roulette Monte Carlo again
# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the average outcome from 10,000 bets on green.
# Compute the average and standard deviation of the resulting list to confirm the results from previous exercises using the Central Limit Theorem.

# The variable `n` specifies the number of independent bets on green
n <- 10000

# The variable `B` specifies the number of times we want the simulation to run
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)

# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times
S <- replicate(B,{
  X <- sample(c(17,-1),n,replace = TRUE,prob = c(p_green,p_not_green))
  mean(X)
})

# Compute the average of `S`
mean(S)

# Compute the standard deviation of `S`
sd(S)

# Exercise 10. American Roulette comparison
# In a previous exercise, you found the probability of winning more than $0 after betting on green 10,000 times using the Central Limit Theorem. Then, you used a Monte Carlo simulation to model the average result of betting on green 10,000 times over 10,000 simulated series of bets.
# What is the probability of winning more than $0 as estimated by your Monte Carlo simulation? The code to generate the vector S that contains the the average outcomes of 10,000 bets modeled 10,000 times has already been run for you.

mean(S > 0)

# Exercise 11. American Roulette comparison analysis
# The Monte Carlo result and the CLT approximation are now much closer than when we calculated the probability of winning for 100 bets on green. What could account for this difference?

The CLT works better when the sample size is larger.





