# The SAT was recently changed to reduce the number of multiple choice options from 5 to 4 and also to eliminate the penalty for guessing.
n <- 44

# Question 2a
# Suppose that the number of multiple choice options is 4 and for an incorrect question gives a score of 0.
# What is the expected value of the score when guessing on this new test?
exp_value <- 1*(1/4) + (0 * (3/4))
mu <- n * exp_value

# Question 2b
# Consider a range of correct answer probabilities p <- seq(0.25, 0.95, 0.05) representing a range of student skills.
# What is the lowest p such that the probability of scoring over 35 exceeds 80%?
p <- seq(0.25, 0.95, 0.05)

f <- function(p){
  mu <- n * (1*p) + (0 * (1-p))
  er <- sqrt(n) * abs(1-0) * sqrt(p*(1-p))
  1 - pnorm(35,mu,er)
}

sapply(p,f)