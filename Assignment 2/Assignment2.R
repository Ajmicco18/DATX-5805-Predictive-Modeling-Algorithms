install.packages('ISLR')
data(Carseats, package = 'ISLR')

mlr.fit = lm(Sales ~ Price + US, data=Carseats)
summary(mlr.fit)

predict(mlr.fit, data.frame(Price=135, US="Yes"))

mlr.interaction = lm(Sales ~ Price + US + Price:US, data=Carseats)
summary(mlr.interaction)

lm.carseats = lm(Sales~.,data=Carseats)
summary(lm.carseats)

baseModel = lm(Sales~1,data =Carseats)
fullModel = lm(Sales~., data = Carseats)
step(baseModel,scope=list(upper=fullModel,lower=~1),direction="forward")

mlr.final = lm(Sales~ShelveLoc+Price+CompPrice+Advertising+Age+Income, data=Carseats)
summary(mlr.final)
