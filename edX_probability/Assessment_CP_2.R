# Create a vector with a sequence of integers from 1 to 36.
x <- seq(1,36)

# Use dnorm to determine the value of the probability density function over x given a mean of 20.9
# and standard deviation of 5.7; save the result as f_x.
f_x <- dnorm(x,20.9,5.7)

# Plot x against f_x.
plot(x,f_x)