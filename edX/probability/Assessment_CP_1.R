# Set seed to 16.
set.seed(16,sample.kind = "Rounding")

# Generate a normal distribution of 10000 tests with a mean of 20.9 and standard deviation of 5.7.
act_scores <- rnorm(10000,20.9,5.7)

# Calculate the mean of act_scores.
mean(act_scores)

# Calculate the standard deviation of act_scores.
sd(act_scores)

# How many perfect scores are there out of 10,000 simulated tests?
sum(act_scores >= 36)

# What is the probability of the score being greater than 30?
F <- function(a) mean(act_scores <= a)

prob_30 <- 1 - F(30)
prob_30

# What is the probability of the score being less than or equal to 10?
prob_10 <- F(10)
prob_10
