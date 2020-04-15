# Questions 1 and 2: SAT testing
# The SAT is a standardized college admissions test used in the United States.
# The following two multi-part questions will ask you some questions about SAT testing.
# An old version of the SAT college entrance exam had a -0.25 point penalty for every incorrect answer
# and awarded 1 point for a correct answer.
# The quantitative test consisted of 44 multiple-choice questions each with 5 answer choices.
# Suppose a student chooses answers by guessing for all questions on the test.
n <- 44

# Question 1a
# What is the probability of guessing correctly for one question?
1/5

# Question 1b
# What is the expected value of points for guessing on one question?
exp_value <- 1*(1/5) + (-0.25 * (4/5))
exp_value

# Question 1c
# What is the expected score of guessing on all 44 questions?

mu <- n * exp_value
mu

# Question 1d
# What is the standard error of guessing on all 44 questions?

# Calculate the standard errpr of guessing on one question.
std_error <- (1 - -0.25) * sqrt((1/5) * (4/5))

# Now calculate the standard error for all 44 questions.
er <- sqrt(n) * std_error
er

# Question 1e
# Use the Central Limit Theorem to determine the probability that a guessing student scores 8 points or higher on the test.
1 - pnorm(8,mu,er)

# Question 1f
# Set the seed to 21, then run a Monte Carlo simulation of 10,000 students guessing on the test.
# What is the probability that a guessing student scores 8 points or higher?
set.seed(21,sample.kind = "Rounding")

X <- replicate(10000,{
  s <- sample(c(1,-0.25),size = 44,replace = TRUE,prob = c(1/5,4/5))
  sum(s)
})

sum(X>=8)/10000