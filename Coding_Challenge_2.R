##### Coding Challenge 2 ######
#### Practicing ggplot2 ####

### Question 2: Creating a boxplot ###
## Read the .csv data file ##
myco <- read.csv("MycotoxinData.csv", na.strings = "na")
str(myco)
View(myco)

## Install ggplot2 package and load the library ##
install.packages("ggplot2")
library(ggplot2)

## Creating a boxplot with the geom_boxplot() function ##
ggplot(myco, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot()
  xlab("") +
  ylab("DON (ppm)")

### Question 3: Convert the boxplot into a bar chart ###
## Using the stat_summary command and specifying geom="bar". Also dodged the positions of the bar ##
ggplot(myco, aes(x = Treatment, y = DON, color = Cultivar)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)")

### Question 4: Adding points to the foreground ###
## Added fill for Cultivar, outlined points in black, specifiec shape ##
ggplot(myco, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(color = "black", position=position_jitterdodge(dodge.width=0.9), shape = 21)

### Question 5: Change the fill color of the points and boxplots to match some colors in the palette ###
cbbPalette <- c("#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

## Add scale_fill_manual for the layers of the bars ##
ggplot(myco, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(color = "black", position=position_jitterdodge(dodge.width=0.9), shape = 21) +
  scale_fill_manual(values = cbbPalette)

### Question 6: Add a facet to the plots based on cultivar ###
## Adding facet_wrap(~Cultivar) for splitting the plots ##
## scale = "free" option adjusts the data so that it excludes parts of the axes where no data occurs ##
ggplot(myco, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(color = "black", position=position_jitterdodge(dodge.width=0.9), shape = 21) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar, scale = "free")

### Question 7: Add transparency to the points so you can still see the boxplot or bar in the background ###
## Adding alpha in the geom_point layer for transparency, where alpha = 0 is fully transparent and alpha = 1 is fully opaque ##
ggplot(myco, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun=mean,geom="bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_point(color = "black", position=position_jitterdodge(dodge.width=0.9), shape = 21, alpha = 0.5) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar, scale = "free")

### Question 8: Make a violin plot ##
## Using geom_violin() function ##
ggplot(myco, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, position = "dodge") +
  stat_summary(fun.data = mean_se, position = "dodge") +
  xlab("") +
  ylab("DON (ppm)") +
  geom_violin(trim=FALSE,  position = position_dodge(width = 0.9), scale = "width", adjust = 0.6) +
  geom_point(color = "black", position = position_jitterdodge(dodge.width = 0.9), shape = 21, alpha = 0.5) +
  scale_fill_manual(values = cbbPalette) +
  facet_wrap(~Cultivar, scale = "free")


