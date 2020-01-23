#Named matrices

temp_vec <- rep(c("a","B","zZ"),3)  #Replicates the vector 3 times
temp_vec

rep(c("a","B","zZ"),each=3) #Replicates each element 3 times

#Create a matrix from the vector temp_vec.
Bravo <- matrix(temp_vec,3,3)
Bravo

#Assign rownames to the matrix Bravo.
rownames(Bravo) #NULL since row names are not assigned.
rownames(Bravo) <- c("How","are","you?")
rownames(Bravo)

#Assign columnnames to the matrix Bravo.
colnames(Bravo) #NULL since column names are not assigned.
colnames(Bravo) <- c("X","Y","Z")
colnames(Bravo)

#Access matrix elements
Bravo[3,3]
Bravo["you?","Z"]

Bravo[1,2]
Bravo["How","Y"]


#Access rows of the matrix
