#Visualizing Subsets using matplot

Data <- MinutesPlayed[1:3,]   #Get data for first 3 players
Data

#matplot function can be used to visualize the subset. Need to transpose Data first.
#legend function will create a legend of the visual.
matplot(t(Data),type = "b",pch = 15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players[1:3],col = c(1:4,6),pch = 15:18,horiz=FALSE)

#Visualize only the first player.
Data <- MinutesPlayed[1,]   #Get data for first 3 players
Data

matplot(t(Data),type = "b",pch = 15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players[1],col = c(1:4,6),pch = 15:18,horiz=FALSE)

#The plot is incorrect as the subset becomes a vector. Use drop = FALSE for the subset to be matrix.
Data <- MinutesPlayed[1,,drop=FALSE]   #Get data for first 3 players
Data

matplot(t(Data),type = "b",pch = 15:18,col = c(1:4,6))
legend("bottomleft",inset=0.01,legend = Players[1],col = c(1:4,6),pch = 15:18,horiz=FALSE)
