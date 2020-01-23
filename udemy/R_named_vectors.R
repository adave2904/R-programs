#Named vectors
Charlie <- 1:5
Charlie

#access the names of the vector
names(Charlie) #Currently the columns have not been named. Returns NULL.

#assign name to the columns of the vector
names(Charlie) <- c("a","b","c","d","e")
names(Charlie)  #The 5 columns are named a,b,c,d and e.

#Access the fourth element of Charlie.
Charlie["d"]
Charlie[4]

#Clear the names of the vector columns
names(Charlie) <- NULL
names(Charlie)
