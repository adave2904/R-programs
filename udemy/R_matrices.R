mydata <- 1:20
mydata

#matrix() function
#By default the data is populated columnwise.
A <- matrix(mydata,4,5)
A

#Access elements of matrix A.
A[2,3]

#Populate the data row wise.
B <- matrix(mydata,4,5,byrow=TRUE)
B

B[2,5]

#rbind() function
r1 <- c("I","am","Happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)

M1 <- rbind(r1,r2,r3)
M1

#cbind() function
M2 <- cbind(r1,r2,r3)
M2
