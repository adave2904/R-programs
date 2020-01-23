myFirstVector <- c(3, 45, 56, 732, 100, 9)
myFirstVector
is.numeric(myFirstVector)   #TRUE
is.integer(myFirstVector)   #FALSE -- default stored as double
is.double(myFirstVector)    #TRUE

V2 <- c(3L, 45L, 56L, 732L, 100L, 9L)
V2
is.numeric(V2)   #TRUE
is.integer(V2)   #TRUE
is.double(V2)    #FALSE

V3 <- c("a","B23","Hello")
V3
is.character(V3)

z <- seq(1,15,3)  #generates sequence of numbers with step
z

a <- rep("Hi!",3) #replicate the same value 3 times.
a

#Accessing elements of a vector. Index begins with 1.
vectora <- c("a","b","c","d","e")
vectora

#First Element
vectora[1]
#Second Element
vectora[2]
#Third Element
vectora[3]
#All elements except first.
vectora[-1]
#First three elements
vectora[1:3]
#Pass vector to access elements
vectora[c(1,3,5)]
#Pass vector to access all elements except 2nd and 4th.
vectora[c(-2,-4)]


