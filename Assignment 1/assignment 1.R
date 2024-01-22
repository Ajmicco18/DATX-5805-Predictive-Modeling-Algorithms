a = seq (5, 300, by=5)
b = seq (50, 1)

m = a+b

m[9:11]

m[m<80]

table(m>100)
read.csv("A1_College.csv")
