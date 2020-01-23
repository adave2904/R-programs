#Law of Large Numbers
#When n -> infinity, the average of the measure across the sample converges to the expected value of the measusre.

n <- 1000000
counter <- 0

for(i in rnorm(n)){
  if(i >= -1 & i <= 1)
  {
    counter <- counter + 1
  }
}

answer <- counter / n   #compare to normal distribution average of 68.2%
answer
