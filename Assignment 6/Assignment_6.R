library("rpart")
library("rpart.plot")
library("ISLR2")

data("Credit", package="ISLR2")

#Creating test and train data sets
n=nrow(Credit) 
smp_size = ceiling(0.5 * n)  
set.seed(1) 
ind = sample(1:n, size = smp_size) 
train.Credit = Credit[ind, ]  # training data 
test.Credit = Credit[-ind, ]  # test data 

#fitting an unpruned regression tree
set.seed(5)
tree.Credit = rpart(Balance~.,data=train.Credit,
                    method="anova")
rpart.plot(tree.Credit, type=1)

#pruning the tree
printcp(tree.Credit)

plotcp(tree.Credit)

tree.Pruned <- prune(tree.Credit, cp="0.017")

rpart.plot(tree.Pruned)

prunedTest = predict(tree.Pruned, newdata=test.Credit)
mse.pruned = mean((prunedTest - test.Credit$Balance)^2)
mse.pruned

#boosting tree
library("gbm")

set.seed(5)

boost.Credit = gbm(Balance~.,data=train.Credit,
                   distribution="gaussian",n.trees=500,
                   interaction.depth=4)
summary(boost.Credit)

yhat.boost = predict(boost.Credit,newdata=test.Credit)
mse.boost = mean((yhat.boost-test.Credit$Balance)^2)
mse.boost

#random forest
library("randomForest")
set.seed(5)
rf.Credit = randomForest(Balance~.,data=train.Credit,
                         ntree=500,mtry=5, importance=T)
rf.Credit
yhat.rf = predict(rf.Credit,newdata=test.Credit)
mse.rf = mean((yhat.rf-test.Credit$Balance)^2)
mse.rf