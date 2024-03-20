data("College", package="ISLR2")

library("leaps")

fit.bestsub = regsubsets(Apps ~., data=College)
summary(fit.bestsub)

n.var = 12
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
points(12, bestsubSummary$adjr2[12], col="red", cex=1,pch=19)
coef(fit.bestsub, 12)

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
points(12,fwdbestsub$adjr2[12],col="red",cex=1,pch=19)
coef(fwd.bestsub, 12)

#Lasso regression
library("glmnet")
