# Question 3: Betting on Roulette
# A casino offers a House Special bet on roulette, which is a bet on five pockets (00, 0, 1, 2, 3) out of 38 total pockets.
# The bet pays out 6 to 1.
# In other words, a losing bet yields -$1 and a successful bet yields $6.
# A gambler wants to know the chance of losing money if he places 500 bets on the roulette House Special.

# Question 3a
# What is the expected value of the payout for one bet?
exp_value <- 6 * (5/38) + (-1 * (1 - 5/38))

# Question 3b
# What is the standard error of the payout for one bet?
std_error <- abs(6 - -1) * sqrt(5/38 * (1 - (5 / 38)))

# Question 3c
# What is the expected value of the average payout over 500 bets?
# Same as one bet. 
exp_value

# Question 3d
# What is the standard error of the average payout over 500 bets?
std_error / sqrt(500)

# Question 3e
# What is the expected value of the sum of 500 bets?
mu <- 500 * exp_value

# Question 3f
# What is the standard error of the sum of 500 bets?
er <- sqrt(500) * std_error

# Question 3g
# Use pnorm() with the expected value of the sum and standard error of the sum to calculate the probability of losing money over 500 bets,  Pr(𝑋≤0).
pnorm(0,mu,er)






