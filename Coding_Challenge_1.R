##### Coding Challenge 1 #####

#### Task 1 ####
### Practicing some R coding ###

## Creating a vector with values from 1 to 200 #
z <- c(1:200)
z

## Print the mean and standard deviation of z on the console #
mean(z) # Returns 100.5 which is the mean
sd(z) # Returns 57.87918 which is the standard deviation

## Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise #
zlog <- z > 30
zlog # Returns TRUE for all values of z that are greater than 30 and FALSE for all other values

## Make a dataframe with z and zlog as columns. Name the dataframe zdf #
zdf <- data.frame(z, zlog) 
zdf # Printing the dataframe zdf with z and zlog as columns

## Change the column names in your new dataframe to equal “zvec” and “zlogic” #
colnames(zdf) <- c("zvec", "zlogic")
zdf

## Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared #
zdf$zsquared <- zdf$zvec^2
zdf

## Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100 

# Subset using the subset function #
subset(zdf, zsquared > 10 & zsquared < 100) # Returns values of zsquared equal to 16, 25, 36, 49, 64 and 81

# Subset in a different way #
zdf$zsquared[zdf$zsquared > 10 & zdf$zsquared <100] # Returns the values mentioned above but with the use of a logical vector and $

## Subset the zdf dataframe to only include the values on row 26
zdf[26,] # This is also called indexing and it takes the values from all columns on row 26

## Subset the zdf dataframe to only include the values in the column zsquared in the 180th row ##
zdf$zsquared[180] # Returns 32400 which is the value from the zsquared column on row 180

#### Task 2 ####
tips <- read.csv("/Users/anetfilipova/Desktop/Reproducible_Data/TipsR.csv", , na.strings = ".")
str(tips)


#### Task 2 ####
tips <- read.csv("/Users/anetfilipova/Desktop/Reproducible_Data/TipsR.csv", , na.strings = ".")
str(tips)




