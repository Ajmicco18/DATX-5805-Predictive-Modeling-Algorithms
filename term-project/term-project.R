nba <- read.csv("nba_data.csv")

#Further cleaning the data
n=nrow(nba) 
nba$all_nba[nba$all_nba == "False"] <- 0
nba$all_nba[nba$all_nba == "True"] <- 1
str(nba)
nba$all_nba  <- as.numeric(nba$all_nba)
str(nba)

#Creating test and train data sets
set.seed(1)
train.size = ceiling(0.5 * n)
ind = sample(1:nrow(nba),train.size, replace=T)
train = nba[ind,]  # training data 
test = nba[-ind,] # test data

#Fitting the multiple logistic regression model
logit.NBA = glm(all_nba ~.,data=train,family="binomial")
summary(logit.NBA)

#creating confusion matrix to evaluate
pred_NBA.test = predict(logit.NBA,newdata=test, type="response")
predicted.test = rep(0,nrow(test))
predicted.test[pred_NBA.test > 0.5]=1

table(test$all_nba, predicted.test)

errorRate.test = mean(test$all_nba != predicted.test)
errorRate.test
