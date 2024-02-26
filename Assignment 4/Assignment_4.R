set.seed(123) 

x = rnorm(100) 

y = x + 2*x^2 + rnorm(100) 

mydata= data.frame(x,y) 

plot(x,y,xlab="x", ylab="y", pch=19)
