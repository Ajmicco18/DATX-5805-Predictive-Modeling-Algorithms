a = seq (5, 300, by=5)
b = seq (50, 1)

m = a+b

m[9:11]

m[m<80]

table(m>100)
college <- read.csv("A1_College.csv")

sd(college$Apps)
sd(college$Enroll)
mean(college$Apps)
mean(college$Enroll)
table(college$Private)
percent = (212/777) * 100

boxplot(college$Outstate)

boxplot(college$Outstate ~ college$Private)

hist(college$Outstate, xlab="Tution Cost", ylab="# of Schools", main="Colleges' Out of state Tuition Cost")

plot(college$Apps, college$Accept, xlab="Number of Applications", ylab="Number Accepted")

