library("readxl")

mydata <- read_excel("Assignment3_HeartDisease.xlsx")

set.seed(1)
train.size = floor(0.7*nrow(mydata))
ind = sample(1:nrow(mydata),train.size, replace=F)

train = mydata[ind,]
test = mydata[-ind,]

logit.m = glm(HeartDisease ~ Age + Gender + ChestPainType + RestingBP +FastingBS, 
              data=train,family="binomial")
summary(logit.m)

prob <- predict(logit.m, newdata = data.frame(Age=55, Gender="M", ChestPainType="ATA",RestingBP=130,FastingBS = 121),type = "response")

pred_prob.test = predict(logit.m,newdata=test,type="response")
predicted.test =rep(0,nrow(test))
predicted.test[pred_prob.test > 0.5]=1

table(test$HeartDisease, predicted.test)

errorRate.test = mean(test$HeartDisease != predicted.test)
errorRate.test
