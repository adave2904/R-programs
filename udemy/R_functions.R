#Functions are a set of code that can be reused for multiple purposes.

myplot <- function(data,rows = 1:10){
  Data <- data[rows,,drop=FALSE]
  matplot(t(Data),type = "b",pch = "15:18",col = c(1:4,6))
  legend("bottomleft",inset = 0.01,legend = Players[rows],col = c(1:4,6),pch = "15:18")
}

myplot(Salary)

myplot(Games,1:5)