###########                    Assessment: Introduction to Discrete Probability                  ###########

# 1. Probability of cyan
# One ball will be drawn at random from a box containing: 3 cyan balls, 5 magenta balls, and 7 yellow balls.
# What is the probability that the ball will be cyan?

cyan <- 3
magenta <- 5
yellow <- 7

balls <- 3 + 5 + 7
prob_cyan <- cyan / balls
prob_cyan # 1/5 or 0.2

# 2. Probability of not cyan
# One ball will be drawn at random from a box containing: 3 cyan balls, 5 magenta balls, and 7 yellow balls.
# What is the probability that the ball will not be cyan?

1 - prob_cyan # 4/5 or 0.8

# 3. Sampling without replacement
# Instead of taking just one draw, consider taking two draws.
# You take the second draw without returning the first draw to the box.
# We call this sampling without replacement.
# What is the probability that the first draw is cyan and that the second draw is not cyan?

# Probability that the first draw is cyan.
a <- cyan / balls # 1/5

# Probability that the second draw is not cyan.
# Here, because the ball is not replaced, total number of balls is now 14.
b <- 1 - (2/14) # 6/7 or 0.8571429

# Probability of first draw being a cyan and the second draw not being a cyan.
pr_a_b <- a * b # 6/35 or 0.1714286

# 4. Sampling with replacement
# Now repeat the experiment, but this time, after taking the first draw and recording the color, 
# return it back to the box and shake the box.
# We call this sampling with replacement.
# What is the probability that the first draw is cyan and that the second draw is not cyan?

# Probability that the first draw is cyan.
a <- cyan / balls # 1/5

# Probability that the second draw is not cyan.
# Here, because the ball is not replaced, total number of balls is now 14.
b <- 1 - (3/15) # 4/5 or 0.8

# Probability of first draw being a cyan and the second draw not being a cyan.
pr_a_b <- a * b # 4/25 or 0.16

