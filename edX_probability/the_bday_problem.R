###                                     The Birthday Problem                                               ###
# Out of 50 random people, what is the probability of two people having the same birthday?

#Get 50 random birthdays
bdays <- sample(1:365,50,replace = TRUE)

#Same birthday
any(duplicated(bdays))

B <- 10000
results <- replicate(B,any(duplicated(bdays)))

mean(results)