#Subsets

#Subset of a vector is a vector.
x <- c("a","b","c","d","e")
x[c(1,5)] #subset with first and fifth element of vector x. Also a vector.
x[1]      #subset with first element of vector x. Also a vector.

#Subset of a matrix is a matrix unless only one row is present in the subset.
Games

#Get the number of games played by KobeBryant, JoeJohnson and LeBronJames for 2010-2014
Games[1:3,6:10] #subset matrix.

#Get number of games played by KobeBryant and DwayneWade.
Games[c(1,10),] #subset matrix.

#Get data for all players for 2008 and 20009.
Games[,c("2008","2009")]  #subset matrix.

#Get data for KobeBryant
Games[1,]   #subset is not a matrix. It is a vector.
is.matrix(Games[1,]) #FALSE
is.vector(Games[1,]) #TRUE

#For any subset matrix with only one row, R drops the row dimension.
#To not let that happen, use drop = FALSE while defining the subset.
Games[1,,drop=FALSE]
is.matrix(Games[1,,drop=FALSE]) #TRUE

