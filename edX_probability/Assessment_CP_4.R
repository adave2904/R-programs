# Write a function that takes a value and produces probability of a score less than or equal to that value.
# Apply this function to the range 1 to 36.
F <- function(a) mean(act_scores <= a)
F(30) #0.9473
F(31) #0.9645

# What is the expected 95th percentile of ACT scores?
qnorm(0.95,20.9,5.7)

# Make a vector containing the quantiles for p <- seq(0.01, 0.99, 0.01), the 1st through 99th percentiles of the act_scores1 data.
sample_quantiles <- quantile(act_scores1,p <- seq(0.01, 0.99, 0.01))

# In what percentile is a score of 26?
(sample_quantiles >= 26)

# Make a set of theoretical quantiles over the interval p <- seq(0.01, 0.99, 0.01) with mean 20.9
# and standard deviation 5.7
p <- seq(0.01, 0.99, 0.01)
theoretical <- qnorm(p,20.9,5.7)
theoretical_quantiles <- quantile(theoretical,p <- seq(0.01, 0.99, 0.01))

qqplot(theoretical_quantiles,sample_quantiles)