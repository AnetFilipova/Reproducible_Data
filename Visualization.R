##### Data Visualization #####

#### Basic built-in plot features in R ####

data("mtcars")
view(mtcars)

## seeing the structure of the data ##
str(mtcars) ## returns that it is a data frame

## Creating a plot using basic R functions such as the plot() function and the arguments x and y to make a basic scatter plot ##

plot(x = mtcars$wt, y = mtcars$mpg,
     xlab = "Car weigth", ## X axis label
     ylab = "Miles per galon", ## Y axis label
     font.lab = 6, ## font of the labels
     pch = 6) ##  shape of the points

#### Getting started with ggplot2 ####

install.packages("ggplot2")
library(ggplot2)

### Creating an empty ggplot figure ###
## Basic syntax ##
ggplot()

## Filling up the aesthetic mappings with the function aes() which is essentially where we put our x and y variables, along with some other things ##

ggplot(mtcars, aes(x = wt, y = mpg)) ## This is basically the background layer and the aes() function returns the X and Y axes but no data points yet.  ##

## Addidng Data or Layers with the "+" sign and the function geom()  ##
# Two Continuous Numerical Variables #

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + ## populates the data points on the graph 
  geom_smooth(method = lm, se = FALSE) ## puts the best fitting linear relationship with 95% confidence intervals or without them with the extra function se = FALSE ##

## If we want to change the order of the layers, e.g. data points at the forefront and line at the background, then just swap the order in the actual code ##

ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE, color = "black") +
  geom_point(color = "blue") + ## now points are at the forefront
  xlab("Weight") +
  ylab ("Miles per galon")

## We can also control specifically which geom we want to alter by putting a new aes argument within geom_point for example ##
## Scales ##

ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE, color = "black") +
  geom_point(aes(size = wt), color = "blue") + ## now the data points correspond to weight size
  xlab("Weight") +
  ylab ("Miles per galon")

## Until here, the color of the data points is outside the aesthetics for geom_point##
# We can now include it in the aes function which will give a gradient of colour based on weight size #

ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm, se = FALSE, color = "black") +
  geom_point(aes(size = wt, color = wt)) + ## now the data points correspond to weight size AND color 
  xlab("Weight") +
  ylab ("Miles per galon") +
  scale_color_gradient(low = "grey", high = "blue") ## changing the gradient color of the data points ##

#### Categorical X + Numeric  Y variable ####

### Box Plots ###
## read data ##
bull.richness <- read.csv("Bull_richness.csv")

## Subsetting the data starting with the soybean data ##
bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" & bull.richness$Treatment == "No-till",]

## Creating the ggplot ##
ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide)) +
  geom_boxplot() +
  xlab("Growth stage") +
  ylab("Fungal richness") +
  geom_point(position=position_jitterdodge(dodge.width=0.9)) ## Show the distribution of the data where “jitter” distributes the points over the boxplot ##

### Bar Charts ###
## The stat feature allows us to calculate common summary statistics and plot them from raw data ##

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, color = Fungicide, fill = Fungicide)) + ## color is the outside colored lines while fill is the color inside the bars #
  geom_point(position=position_jitterdodge(dodge.width=0.9)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") + ## stat_summary plots the mean and the standard error
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") + 
  xlab("Growth stage") +
  ylab("Fungal richness")

### Lines Connecting Means ###

ggplot(bull.richness.soy.no.till, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + ## the group function uses the fungicide as a uniting variable between the groups ##
  stat_summary(fun=mean,geom="line") + ## This will produce a time series with a line connecting the points ##
  stat_summary(fun.data = mean_se, geom = "errorbar") + 
  xlab("Growth stage") +
  ylab("Fungal richness")

#### Faceting ####
## Faceting allows us to make separate plots for each subset of our data, for example  ##

ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) + 
  stat_summary(fun=mean,geom="line") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +
  ylab("Bulleribasidiaceae \n richness") + 
  xlab("") +
  facet_wrap(~Treatment*Crop, scale = "free") ## faceting or splitting by Treatment*Crop interaction ##
                                             ## the scale = "free" option adjusts the data so that it excludes parts of the axes where no data occurs #



