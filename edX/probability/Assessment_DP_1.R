# Question 1: Olympic running
# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals (order matters).
# In the 2012 Olympics, 3 of the 8 runners were from Jamaica and the other 5 were from different countries.
# The three medals were all won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).
# Use the information above to help you answer the following four questions.

# Question 1a
# How many different ways can the 3 medals be distributed across 8 runners?
medals <- permutations(8,3)
nrow(medals) # 336

# Question 1b
# How many different ways can the three medals be distributed among the 3 runners from Jamaica?
jamaica <- permutations(3,3)
nrow(jamaica) # 6

# Question 1c
# What is the probability that all 3 medals are won by Jamaica?
nrow(jamaica) / nrow(medals) # 0.0179

# Question 1d
# Run a Monte Carlo simulation on this vector representing the countries of the 8 runners in this race:

runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
set.seed(1,sample.kind = "Rounding")
results <- replicate(10000,{
  winners <- sample(runners,3)
  (winners[1] %in% "Jamaica" & winners[2] %in% "Jamaica" & winners[3] %in% "Jamaica")
})

mean(results)


