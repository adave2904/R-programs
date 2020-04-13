# Generate a vector of 2 red beads and 3 blue beads.
beads <- rep(c("red","blue"),times = c(2,3))
# Pick one bead at random. Print 1 if the bead is blue. For red beads, print 0.
x <- ifelse(sample(beads,1) == "blue",1,0)
x

############################################################################################################
##############                                  Sampling Models                               ##############
############################################################################################################

# Generate a vector that consists of Roulette Wheel pockets.
rw <- rep(c("red","black","green"),c(18,18,2))

# Place 1000 bets. If red pocket comes up, the casino loses $1. Else casino wins $1.
x <- sample(ifelse(rw == "red",-1,1),1000,replace = TRUE)
x

# Generate a sampling model without defining the color.
y <- sample(c(-1,1),n,replace = TRUE,prob = c(9/19,10/19))

# Calculate the total winnings.
sum(x) #28
S <- sum(y) #64

# Monte Carlo simulation.
n <- 1000
B <- 10000
S <- replicate(B,{
  x <- sample(c(-1,1),n,replace = TRUE,prob = c(9/19,10/19))
  sum(x)
})

# Calculate the probability that the casino is losing money.
mean(S < 0) #0.0464

# Define a function for the probability.
F <- function(a) mean(S <= a)

#Plot a histogram showing the probability F(b) - F(a) for intervals (a,b].
s <- seq(min(S),max(S),100)
normal_density <- data.frame(s = s, f = dnorm(s,mean(S),sd(S)))

data.frame(s = S) %>%
  ggplot(aes(S,..density..)) +
  geom_histogram(color = "black",binwidth = 10) +
  ylab("Probability") +
  geom_line(mapping = aes(s,f),data = normal_density,color = "blue")


