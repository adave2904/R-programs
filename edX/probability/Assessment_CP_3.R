# Calculate the mean of act_scores.
avg <- mean(act_scores) # 20.84012

# Calculate the standard deviation of act_scores.
s <- sd(act_scores) # 5.675237

#Generate a normal distribution of 10000 tests with the above mean and standard deviation values.
act_scores1 <- rnorm(10000,20.84012,5.675237)

# Calculate z-scores by subtracting the mean from act_scores1 and then dividing by standard deviation.
z_scores <- (act_scores1 - avg) / s

# What is the probability of the Z-score being greater than 2?
F <- function(a) mean(z_scores <= a)

prob_2 <- 1 - F(2)
prob_2

# Which ACT score corresponds to z-score value of 2?
# Determine the value using the formula to derive z-scores.

act_score_2 <- (2 * s) + avg
act_score_2

# What is the 97.5th percentile of act_scores1?
qnorm(0.975,avg,s)
