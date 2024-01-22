#Defines two sequential vectors
a = seq (5, 300, by=5)
b = seq (50, 1)

#Adds the two vectors and assigns the new vector to m
m = a+b

#Outputs the 9th, 10th and 11th values of m
m[9:11]

#Outputs the values of m less than 80
m[m<80]

#Provides the number of values of m less than 100
table(m>100)

#Reads in the csv data and assigns it to a data set called college
college <- read.csv("A1_College.csv")

#Finds the mean for the Apps and Enroll columns
mean(college$Apps)
mean(college$Enroll)

#Finds the standard deviation for the Apps and Enroll columns
sd(college$Apps)
sd(college$Enroll)

#Finds the number and percentage of public schools
table(college$Private == "No")
percent = (212/777) * 100

#Creates a boxplot of Outstate column
boxplot(college$Outstate, data=college, ylab="Cost")

#Creates a side-by-side boxplot for Outstate and Private
college_data = cbind(college$Outstate, table(college$Private))
boxplot(college_data, beside=T, names=c("Outstate","Private"))

#Creates a histogram for Outstate
hist(college$Outstate, xlab="cost", ylab="Number of Schools", main="Out of State Tuition Cost")

#Creates a Scatterplot for Apps vs. Accept
plot(college$Apps, college$Accept, xlab="Applications", ylab="Accepted")



