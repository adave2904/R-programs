B <- 10000

stick <- replicate(
B,{doors <- as.character(1:3)        #3 doors
prize <- sample(c("car","goat","goat"))                 #Prizes
prize_door <- doors[prize == "car"]                     #The door behind which there is prize.
my_pick <- sample(doors,1)                              #Contestant picks the door.
show <- sample(doors[!doors %in% c(my_pick,prize_door)],1)  #Show the door except the pick and prize
stick <- my_pick                                            #Contestant does not change the pick.
stick == prize_door                                         #Check if the door chosen by the contestant is the prize door.
})

mean(stick)     #Probability of the chosen door being the prize door.

switch <- replicate(
  B,{doors <- as.character(1:3)        #3 doors
  prize <- sample(c("car","goat","goat"))                 #Prizes
  prize_door <- doors[prize == "car"]                     #The door behind which there is prize.
  my_pick <- sample(doors,1)                              #Contestant picks the door.
  show <- sample(doors[!doors %in% c(my_pick,prize_door)],1)  #Show the door except the pick and prize
  switch <- doors[!doors %in% c(my_pick,show)]                                            #Contestant does not change the pick.
  switch == prize_door                                         #Check if the door chosen by the contestant is the prize door.
})

mean(switch)     #Probability of the switched door being the prize door.

help(rowSums)