##### Monte Carlo Simulation #####
##### Derive probability by repeating an experiment a large number of times that the results are similar to
##### those observed if the experiment was repeated forever.

#Create an urn with 2 read beads and 3 blue beads
beads <- rep(c("red","blue"),times = c(2,3)) #Replicate function

#Pick one bead at random from the urn.
sample(beads,1)

#Repeat the randome event 10000 times
B <- 10000

events <- replicate(B,sample(beads,1)) #pick up one bead at random 10000 times.

#Categorize the data from the repeated experiment.
tab_data <- table(events)

#View the categorized data
tab_data

#Get the proportion of the categorized data.
prop.table(tab_data)

#Sample the beads 10000 times with the bead replaced after getting picked up.
event1 <- sample(beads,B,replace = TRUE)
tab_data1 <- table(event1)
tab_data1
prop.table(tab_data1)



