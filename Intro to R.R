# This is a comment so no code will be executed

#### This is a section so we can click on the arrow to the left to run this whole section ####

#####

# R is case-sensitive so X is not equal to x

# Learning objectives

# Use basic mathematical operations in R
# Know some of the data types
# Install packages
# Load data into R from a .csv or .txt file

#### Exercise Number 1 ####

# R is a big calculator
2+2 # addition
2-2 # subtraction
2/2 # division
2*2 # multiplication

#### Exercise Number 2 ####

# Creating an object where we can store the result from any of those calculations above into an object

# This is a numeric variable
x <-2 # both '<-' and '=' symbols mean 'equal to' and now both of these objects will appear in our environment
y = 3 # The preferred syntax for 'equal to' is '<-' because '='is used within a funtion

# Now that we have stored these objects, we can execute basic mathematical calculations

x + y # retunrs 5
x -y # returns -1
x/y # returns 0.6666667
x*y #returns 6

# We can also store objects with non-numeric data by putting it in quotes

# This is a character variable designated by the quotes
name <- "Anet"
seven <- "7"
seven + x # Will return an error because 'seven' is a non-numeric object

# We can fix the error above by symply removing the double quotes around 7 and make it a numeric variable again
x + seven # returns 9

#### Exercise Number 3 ####

# Creating Functions. Functions are operations where we do something to the object
# Each function starts with a name and opens parentheses, and you type what you want to do to the object in the parentheses.

# class is one type of function 
class(seven) # it tells us that this is a character variable
class(x) # it tells us that this is a numeric variable

# Use the concatenate function 'c()' to create a vector or a bunch of scalar elements saved together in one object

vec <- c(1, 2, 3, 4, 5, 6, 7) # This is a numeric vector that equals to an object represented by the numbers from 1 to 7
vec1 <- c(1:7) # This is the same thing however instead of typing all the numbers, we can just designate the sequences from 1 to 7 with a ":"
vec <- 1:7 # 1:7 also works without the concatenate function
vec2 <- c("Anet", "Waad") # Returns a chara cter vector
vec3 <- c(TRUE, FALSE) # Returns a logical vector 

vec[4] # By typing the vector named 'vec' and square brackets, it returns us the fourth value from that vector which is 4
vec2[2] # Returns the second character value which is Waad

vec + x # Returns 3 4 5 6 7 8 9 so it adds the scalar x, element wise to the vec object 

# Basic functions in R
vec
mean(vec) # Returns 4 which is the mean value from the vec object
sd(vec) # Returns 2.160247 which is the standard deviation
median(vec) # Returns 4 which is the meadian
min (vec) # Returns 1 which is the min value
max(vec) # Returns 7 which is the max value
summary(vec) # Returns the interquartile range (IQR) which depends on the data class
abs(vec) # Returns the absolute value 
sqrt(vec) # Returns the square root value from each individual value within the object
sqrt(sum(vec)) #Returns 5.291503 which is the square root value from the summed value from 1 to 7
log(vec) # Returns the natural logarithm of every one value from 1 to 7
log10(vec) # Returns the log base 10 of every one value from 1 to 7
log10(sum(vec)) # Returns the log base 10 from the summed value of 1 to 7
exp(vec) # Exponentiate each value to the power of e

#### Logical operators ####

1 > 2 # Returns FALSE
1 < 2 # Returns TRUE
1 <= 1 #Returns TRUE because this sign means less than or equal to
1 == 1 # Returns TRUE because "==" means exactly equal to showing equality between values whereas "=" is  equals (used for assigning values from left to right)

t <- 1:10
t[(t>8) | (t<5)] # Returns values of t such that t is greater than 10 or less than 5
t[(t>8) & (t<10)] # Returns values of t such as t is greater than 8 and less than 10
t[t != 2] # Returns values of t such that t does not equal 2 

# As R if a number exists in a vector
2 %in% t # Returns TRUE because 2 exists in the vector t
22 %in% t #Returns FALSE because 22 does not exist in the vector t

#### Exercise Number 4 ####

## Data types
# scalar objects
x
# vectors
t

# Creating a Matrix. Matrices can only contain numeric, character or logical data
# Example of a numeric matrix containing 3 rows and 3 columns
mat1 <- matrix(data = c(1,2,3), nrow = 3, ncol = 3)

# Example of a character matrix containing 2 rows and 2 columns
mat2 <- matrix(data = c("Anet", "Waad", "Emilia"), nrow = 3, ncol = 3)

mat1[1,2] # Returns 1 because this is the value from the first row on the second column
mat2[,2] # Returns the entire second column

# Creating a Dataframe. Dataframes are most commonly used because they can contain different types of data classes or types (i.e. logical AND numeric)
df <- data.frame(mat1[,1], mat2[,1]) # Returns a data frame with the first columns of mat1 and mat2 and all rows
df # Showing the dataframe in the console

colnames(df) <- c("value", "name") # Renaming the column names
df[1,2] # Returns the value from the first row on the second column
df$value # Returns all the values from the column named "value"
df$name[3] # Returns the third value from the column named "name"

# Subsetting or indexing. Indeing is a way that we can subset the data but first we need to know how different types of data are indexed in order to subset them

df$value[df$name == "Waad"] # Returns the element of the column "value" such that name is equal to Waad
df$value[df$name %in% c("Waad", "Anet")] # The logical operator %in% allows to look for the elements "Waad" and "Anet# within the df
df$value[!df$name %in% c("Waad", "Anet")] # Returns the elements from the column "value" within the dataframe df such that name is not equal to "Waad" or "Anet"

# Subset function
subset(df, name == "Waad") # This is just another way of subsetting the data

# Making a new column in a dataframe
df$log_value <- log(df$value)
df


#### Exercise Number 5 ####

## Installing packages ##

# tidyverse
# lme4
# purrr

install.packages("purrr") # To install the package, the name of the package needs to be in quotes
install.packages("tidyverse")

library(tidyverse) # Loading the package and no quotes are needed

#### Exercise Number 6 ####

## Reading data in R ##
# CSV or TXT

csv <- read.csv("/Users/anetfilipova/Desktop/Reproducible_Data/corr.csv", na.strings = "NA")
str(csv)
 
getwd() # Telling us where exactly (in what working directory) our R project is saved

help("lme4")
help(class)

search()
