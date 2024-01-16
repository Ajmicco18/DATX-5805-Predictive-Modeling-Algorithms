##########################################
##             Introduction             ##
##########################################

## Basic Commands
5 + 5
sqrt(9)
factorial(4)

##########################################
##            Data Structure            ##
##########################################

## R objects
age <-  25
age = 25

## Vectors
# creating  vectors with the c() function 
x = c(23, 24, 30, 19, 26)
major = c("Math","Computer Science", "Biology","Physics", "Math")

# creating  vectors with the seq() and rep() functions 
a = seq(1,10, by=1)
b = seq (1,10, length=10)
c = rep (1:3, 2) # a colon (:) is used to create a sequence of integers

# creating  vectors with R functions starting with r
d = rnorm(10, 5, 2)


## Matrices
m = matrix(c(1,2,3,4,5,6),nrow=2,ncol=3)
# m = matrix(c(1,2,3,4,5,6),nrow=2,ncol=3, byrow=T)

## Data frames
# create a data set using the data.frame() function
mydata = data.frame(id=1:5,
                    Gender=c("M","F","M","F","M"), 
                    Age=c(42, 38,34,56,23))

# use built-in data sets
data() # see the list of built-in R data sets
data(mtcars) # load the data "mtcars"
View(mtcars) # view the data "mtcars"
?mtcars  # learn more about the data "mtcars"

data(Boston,package="ISLR2") # load the data "Boston" from the "ISLR2" package

# Import data 
# Set the working directory by 
# clicking Session -> Set Working Directory -> Choose Directory...
df = read.csv("RIntro_Data.csv") # load a csv (comma-separated values) file
str(df)

# clean data: Replace 1 and 2 with Female and Male
df[df$Gender==1, 'Gender'] = "Female"
df[df$Gender==2, 'Gender'] = "Male"

# or use the ifelse function
# df$Gender  = ifelse(df$Gender==1,"Female","Male")
str(df)
View(df)
head(df) #view the first few rows of the data


## Lists
mylist = list(c(1,2,3),c("A","B"), matrix(1:6, nrow=2))


##########################################
##            Data Handling             ##
##########################################

## Subset data using Brackets
x = c(23, 24, 30, 19, 26) # create a vector, x
x[1]        # extract the first element
x[1:3]      # extract the first three elements
x[-1]       # extract all elements except the first one
mydata[1,2] # extract the element in the 1st row and and 2nd column
mydata[1,]  # extract all elements in the first row
mydata[,1]  # extract all elements in the first column

## Subset data using names and logical vectors
mydata$Age
mydata$Age[mydata$Age < 25]
mydata[mydata$Gender == "F",] 

## Subset data using subset()
subset(mydata,Age <25, select=c(id,Gender))
subset(mydata,Age <25)
subset(mydata,Age <25 & Gender == "F") 
subset(mydata,Age <25 | Gender == "F")

## Missing values
y=c(1,2,3,4,NA)
is.na(y)
y1=na.omit(y)


##########################################
##        Basic Data Summary            ##
##########################################

## Numerical summaries 
str(df) # basic structure of the data set "df"
freq = table(df$Gender) # frequency table for "Gender"
prop.table(freq) # relative frequency table for "Gender"
mean(df$Height) # mean value of the variable Height in the data set, "df"
summary(df$Height) # summary statistic fo the variable Height 


## Scatterplot
# base R function
plot(df$Height, df$Weight) 
plot(df$Height, df$Weight,
     xlab="Height(inches)", ylab="Weight(lbs)",
     main="Figure 1. Scatterplot of Weight and Height")

# R package: ggplot2
library("ggplot2")
ggplot(df, aes(Height,Weight)) + 
  geom_point()

# label axes and add a title
ggplot(df, aes(Height,Weight)) + 
  geom_point() +
  ggtitle("Figure 2: Scatterplot of Weight versus Height") +
  xlab("Height (inches)") + 
  ylab("Weight (lbs)")


## Boxplot
# base R function
boxplot(df$Height) # boxplot for the variable "Height"
boxplot(df$Height, horizontal=T, 
        xlab="Height (inches)", main = "Boxplot of Height")

# side-by-side boxplots
boxplot(Height ~ Gender, data=df,
        horizontal=T, 
        xlab="Height (inches)", 
        main = "Distribution of Height by Gender ")

# R package: ggplot2
ggplot(df, aes(x = Gender, y = Height)) + 
  geom_boxplot() +
  coord_flip()

# change color 
ggplot(df, aes(x = Gender, y = Height)) + 
  geom_boxplot(color="blue",outlier.color="red") +
  coord_flip()


# different color for female and male
ggplot(df, aes(x = Gender, y = Height, fill=Gender)) + 
  geom_boxplot() +
  coord_flip()

# add a mean value to the boxplot
ggplot(df, aes(x = Gender, y = Height, fill=Gender)) + 
  geom_boxplot() +
  stat_summary(fun.y="mean", geom="point", shape=5, 
               size=6, color="green")+
  coord_flip() +
  ggtitle("Side-by-Side Boxplot") +
  ylab("Height (inches)") + 
  xlab("Gender")

## Save plots
# save plots built with base R functions
pdf("Boxplot_Height.pdf") # open a pdf file
boxplot(df$Height)        # create a plot
dev.off()                 # close the pdf file

# save plots built with R package "ggplot2"
boxplot.gg = ggplot(df, aes(x = Gender, y = Height, fill=Gender)) + 
  geom_boxplot() +
  coord_flip()
ggsave("myplot.pdf", plot= boxplot.gg, width=6,height=6)
dev.off()
