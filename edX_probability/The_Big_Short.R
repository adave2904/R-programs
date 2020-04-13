# A bank gives out 1000 loans in a year.
n <- 1000

# The loans are worth $180,000. Suppose the bank loses $200,000 per foreclosure.
loss_per_fc <- -200000

# Probability of defaulting is 2%.
p <- 0.02

# Sample Modeling for these loans to see if the bank makes money or loses money.
defaults <- sample(c(0,1),n,replace = TRUE,prob = c(1-p,p))
sum(defaults * loss_per_fc)

# Monte Carlo Simulation.
B <- 10000
losses <- replicate(B,{
  defaults <- sample(c(0,1),n,replace = TRUE,prob = c(1-p,p))
  sum(defaults * loss_per_fc)
})

# Plot the distribution.
data.frame(losses_in_million = losses / (10 ^ 6)) %>% ggplot(aes(losses_in_million)) +
  geom_histogram(binwidth = 1,col = "black")

# Expected Value
mu <- n * ((p * loss_per_fc) + ((1-p) * 0))

# Standard Error
sqrt(n) * abs(loss_per_fc) * sqrt(p*(1-p))

# Define an interest rate so that the bank can break even.
# (loss * p) + (x * (1-p)) = 0

interest <- (0 - (loss_per_fc * p)) / (1-p)
int_rate <- (interest / 180000) * 100 # ~2.28%

# To ensure bank makes money without keeping the interest rate too high,
# lets have the chance of losing money to be 1 in 100 (0.01).
# Pr(S < 0) = 0.01

# Expected value for all loans
mu
z <- qnorm(0.01)

#The interest amount.
x <- -loss_per_fc * (((n * p) - z * sqrt( n * p * (1-p))) / ((n * (1-p)) + z * sqrt( n * p * (1-p))))

# Interest Rate
x / 180000 * 100 # ~3.47%

# Expected Profit per loan.
profit <- loss_per_fc * p + x * (1-p) # 2124

# Total Profit.
total_profit <- profit * n
total_profit #~2 million.