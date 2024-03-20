set.seed(123) 

x = rnorm(100) 

y = x + 2*x^2 + rnorm(100) 

mydata= data.frame(x,y) 

plot(x,y,xlab="x", ylab="y", pch=19)

sample_size = floor(0.5 * nrow(mydata))

#Using first random seed
set.seed(87)
ind = sample(nrow(mydata), size=sample_size)
train = mydata[ind,]
test = mydata[-ind,]

glm.fit = glm(y ~ x, data=mydata)

library("boot")
cv.err = cv.glm(mydata, glm.fit)
cv.err$delta[1]

cv.error =rep(0,4)
for (i in 1:4){
 glm.fit = glm(y ~ poly(x,i),data=mydata)
 cv.error[i] = cv.glm(mydata,glm.fit)$delta[1]
}

cvDF<-data.frame(degree=1:4, cv.error)
cvDF

plot(1:4, cv.error, pch=18, col="blue", type="b",
     xlab="Degree of Polynomial", ylab="LOOCV MSE")


#Using second random seed
set.seed(43)
ind2 = sample(nrow(mydata), size=sample_size)
train2 = mydata[ind2,]
test2 = mydata[-ind2,]

glm.fit2 = glm(y ~ x, data=mydata)

cv.error2 =rep(0,4)
for (i in 1:4){
  glm.fit2 = glm(y ~ poly(x,i),data=mydata)
  cv.error2[i] = cv.glm(mydata,glm.fit2)$delta[1]
}

cvDF2<-data.frame(degree=1:4, cv.error2)
cvDF2


#Using 10-fold cross validation with set.seed(100)
set.seed(100)
cv.error.10 = rep(0,4)

for (i in 1:4){
  glm.fit = glm(y~poly(x,i),data=mydata)
  cv.error.10[i] =cv.glm(mydata,glm.fit,K=10)$delta[1]
}

cv.error.10


#Using 10-fold cross validation with set.seed(200)
set.seed(200)
cv.error.10 = rep(0,4)

for (i in 1:4){
  glm.fit = glm(y~poly(x,i),data=mydata)
  cv.error.10[i] =cv.glm(mydata,glm.fit,K=10)$delta[1]
}

cv.error.10


            

