data("heights")

### Define a vector to get data for all male students
x <- heights %>% filter(sex=="Male") %>% pull(height)

### Create a function to define the empirical distribution of heights.
### For any value a, this function gives the proportion of values in the vector x that are smaller or equal to a.
F <- function(a) mean(x <= a)

### If a male student is picked at random, what is the chance that he is taller than 70.5 inches?

### Calculate the probability that the student is not taller than 70.5 inches.
F(70.5)
### The probability that a student is taller than 70.5 inches is :
1 - F(70.5) ### ~37%

### Calculate the probability that height of the student is between 50 and 65 inches.
F(65) - F(50)


############################################################################################################

# Cumulative distribution for a normal distribution is defined using pnorm().
# Formula: F(a) = pnorm(a,avg,s) 
# A random quantity is normally distributed with average avg and standard deviation s if F(a) holds for all
# values of a.

### Calculate the probability that the student is not taller than 70.5 inches.
F1 <- function(a,x) pnorm(a,mean(x),sd(x))

1 - F1(70.5,x)

### Considering the height data as discrete.
plot(prop.table(table(x)), xlab = "a = Height in inches", ylab = "Pr(x = a)")

############################################################################################################
#                                            Monte Carlo Simulations                                       #
############################################################################################################
### Define a vector to get data for all male students
x <- heights %>% filter(sex=="Male") %>% pull(height)

# Determine the length of the vector
n <- length(x)

# Determine the average of the vector
avg <- mean(x)

# Determine the standard deviation for the vector
s <- sd(x)

#Generate randomly distributed outcomes.
simulated_heights <- rnorm(n,avg,s)

#Plot the distributed outcomes.
data.frame(simulated_heights = simulated_heights) %>% ggplot(aes(simulated_heights)) + geom_histogram(color = "black",binwidth = 2)
 

###### Monte Carlo simulation to see how rare is it for the tallest person to be a seven footer

# Number of simulations
B <- 10000

#For each simulation, generate 800 normally distributed values and get the max value.
tallest <- replicate(B,{
  simulated_data <- rnorm(800,avg,s)
  + max(simulated_data)
  }
)

#From the above data, get the probability that the tallest person is a seven footer.

mean(tallest >= 7 * 12)     #0.0216








