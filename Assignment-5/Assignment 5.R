data("College", package="ISLR2")

library("leaps")

fit.bestsub = regsubsets(Apps ~., data=College)
summary(fit.bestsub)

n.var = 17
fit.bestsub = regsubsets(Apps ~.,data=College,nvmax=n.var)
summary(fit.bestsub)

#Looking for smallest cp, bic, aic for best fit
#Looking for biggest adjusted r squared for best
bestsubSummary = summary(fit.bestsub)

#bic best fit
bestsubSummary$bic
plot(bestsubSummary$bic,xlab="Number of variables",
     ylab="BIC", type="l")
which.min(bestsubSummary$bic)
points(10,bestsubSummary$bic[10],col="red",cex=1,pch=19)
coef(fit.bestsub, 10)

#adjusted r squared best fit
bestsubSummary$adjr2
plot(bestsubSummary$adjr2, xlab="Number of variables",
     ylab="Adjusted R Squared", type="l")
which.max(bestsubSummary$adjr2)
points(13, bestsubSummary$adjr2[13], col="red", cex=1,pch=19)
coef(fit.bestsub, 13)

#forward step wise selection
fwd.bestsub = regsubsets(Apps ~.,data=College,nvmax=n.var,
                      method="forward")
summary(fwd.bestsub)
fwdbestsub = summary(fwd.bestsub)

#BIC best fit
fwdbestsub$bic
plot(fwdbestsub$bic,xlab="Number of variables",
     ylab="BIC", type="l")
which.min(fwdbestsub$bic)
points(10,fwdbestsub$bic[10],col="red",cex=1,pch=19)
coef(fwd.bestsub, 10)

#adjusted R squared best fit
fwdbestsub$adjr2
plot(fwdbestsub$adjr2,xlab="Number of variables",
     ylab="Adjusted R Sqaured", type="l")
which.max(fwdbestsub$adjr2)
points(13,fwdbestsub$adjr2[13],col="red",cex=1,pch=19)
coef(fwd.bestsub, 13)

#Lasso regression
library("glmnet")
library("plotmo")

X = model.matrix(Apps~.,College)[,-1]

Y = College$Apps

fit.lasso = glmnet(X,Y,alpha=1)

plot(fit.lasso,xvar="lambda")

plot_glmnet(fit.lasso,xvar="lambda",label=5)

set.seed(123)
cv.lambda.l = cv.glmnet(X,Y, alpha=1)

plot(cv.lambda.l)

lmin.l = cv.lambda.l$lambda.min

coef(cv.lambda.l, s=lmin.l)