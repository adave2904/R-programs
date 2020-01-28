#Take numbers 1 to 100.
#If the number is a multiple of 3, print "Fizz".
#If the number is a multiple of 5, print "Buzz".
#If the number is a multiple of 3 and 5, print "FizzBuzz".

for(i in 1:100)
{
  if(i %% 3 == 0 && i %% 5 == 0)
  {
    print("FizzBuzz")
  }
  else if(i %% 3 == 0)
  {
    print("Fizz")
  }
  else if(i %% 5 ==0)
  {
    print("Buzz")
  }
  else
  {
    print(i)
  }
}
