#While loop
counter <- 1

while(counter < 12)
{
  print(counter)
  counter <- counter + 1
}

#For loop
for(i in 1:5)   #1:5 is a vector of numbers. similar to array.
{
  print("Hello R")
}

#if

x <- rnorm(1)  #generate a random number
rm(answer)    #clear variable from memory
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}


