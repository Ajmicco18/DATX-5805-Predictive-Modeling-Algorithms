nba <- read.csv("nba_data.csv")

#Creating test and train data sets
n=nrow(nba) 
smp_size = ceiling(0.5 * n)  
set.seed(1) 
ind = sample(1:n, size = smp_size) 
train.NBA = nba[ind, ]  # training data 
test.NBA = nba[-ind, ]  # test data

cleanTrain.NBA = na.omit(train.NBA)
cleanTest.NBA = na.omit(test.NBA)

#fitting logistic model
library("nnet")
logit.nba <- multinom(all_nba ~ .,data = train.NBA)
summary(logit.nba)
