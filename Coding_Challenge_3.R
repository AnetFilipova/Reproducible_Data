### PLPA 5820 Intro to R
## Coding Challenge #3 Data Visualization

#### Load in Data ####
Myco <- read.csv("/Users/anetfilipova/Desktop/Reproducible_Data/MycotoxinData.csv", na.strings = "na")
View(Myco)
str(Myco)

#### Make Plots ####
# Install and load
install.packages("ggplot2")
library(ggplot2)
install.packages("ggpubr")
library(ggpubr)
library(ggrepel)

# Question 1
# Make vector containing custom color palette
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Create a boxplot of DON by Treatment 
DONplot <- ggplot(Myco, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +  # A - Define x and y aesthetics
  geom_boxplot(position = position_dodge(), color = "black", outliers = FALSE) + # A - Add boxplots with dodged positions
  xlab("") +  # C - Label the x-axis
  ylab("DON (ppm)") +  # C - Label the y-axis
  geom_point(alpha = 0.6, color = "black", position = position_jitterdodge(dodge.width = 0.9), shape = 21) +  # A,B - Add jittered points with transparency
  theme_classic() +  # D - Use a classic theme for the plot
  scale_color_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]), name = "", labels = c("Ambassador", "Wheaton")) + # A - Manually set colors
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) + # A - Manually set colors
  facet_wrap(~Cultivar, ncol = 2, scales = "free_x")  # E - Create separate panels for each Crop, allowing free x scales
DONplot

# Question 2
# Make variables "Time_Point" and "Crop" into a Factor instead of an Integer
Myco$Treatment <- as.factor(Myco$Treatment)
str(Myco)
# Change ggplot's automatic alphabetical order
Myco$Treatment <- factor(Myco$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))
# Plot again
DONplot <- ggplot(Myco, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar)) +  # A - Define x and y aesthetics
  geom_boxplot(position = position_dodge(), color = "black", outliers = FALSE) + # A - Add boxplots with dodged positions
  xlab("") +  # C - Label the x-axis
  ylab("DON (ppm)") +  # C - Label the y-axis
  geom_point(alpha = 0.6, color = "black", position = position_jitterdodge(dodge.width = 0.9), shape = 21) +  # A,B - Add jittered points with transparency
  theme_classic() +  # D - Use a classic theme for the plot
  scale_color_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]), name = "", labels = c("Ambassador", "Wheaton")) + # A - Manually set colors
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) + # A - Manually set colors
  facet_wrap(~Cultivar, ncol = 2, scales = "free_x")  # E - Create separate panels for each Crop, allowing free x scales
DONplot # Save as object, run object

# Question 3
# Change the y to X15ADON in one plot & change the y to MassperSeed_mg in another plot
X15ADONplot <- ggplot(Myco, aes(x = Treatment, y = X15ADON, color = Cultivar, fill = Cultivar)) +  # A - Define x and y aesthetics
  geom_boxplot(position = position_dodge(), color = "black", outliers = FALSE) + # A - Add boxplots with dodged positions
  xlab("") +  # C - Label the x-axis
  ylab("15ADON") +  # C - Label the y-axis
  geom_point(alpha = 0.6, color = "black", position = position_jitterdodge(dodge.width = 0.9), shape = 21) +  # A,B - Add jittered points with transparency
  theme_classic() +  # D - Use a classic theme for the plot
  scale_color_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]), name = "", labels = c("Ambassador", "Wheaton")) + # A - Manually set colors
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) + # A - Manually set colors
  facet_wrap(~Cultivar, ncol = 2, scales = "free_x")  # E - Create separate panels for each Crop, allowing free x scales
X15ADONplot # Save as object, run object

Massplot <- ggplot(Myco, aes(x = Treatment, y = MassperSeed_mg, color = Cultivar, fill = Cultivar)) +  # A - Define x and y aesthetics
  geom_boxplot(position = position_dodge(), color = "black", outliers = FALSE) + # A - Add boxplots with dodged positions
  xlab("") +  # C - Label the x-axis
  ylab("Seed Mass (mg)") +  # C - Label the y-axis
  geom_point(alpha = 0.6, color = "black", position = position_jitterdodge(dodge.width = 0.9), shape = 21) +  # A,B - Add jittered points with transparency
  theme_classic() +  # D - Use a classic theme for the plot
  scale_color_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]), name = "", labels = c("Ambassador", "Wheaton")) + # A - Manually set colors
  scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]])) + # A - Manually set colors
  facet_wrap(~Cultivar, ncol = 2, scales = "free_x")  # E - Create separate panels for each Crop, allowing free x scales
Massplot # Save as object, run object

# Question 4
# Combine all three figures into one
figure1 <- ggarrange(
  DONplot,  # First plot
  X15ADONplot,  # Second plot
  Massplot,  # Third plot
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 1 rows
  ncol = 3,  # Arrange the plots in 3 column
  common.legend = T  # Include a legend in the combined figure
)
figure1

# Question 5
# Add t test for pairwise comparisons
pDON <- DONplot + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") # Combined

pX15 <- X15ADONplot + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") # Combined

pMass <- Massplot + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") # Combined

# Recombine all three plots
figure2 <- ggarrange(
  pDON,  # First plot
  pX15,  # Second plot
  pMass,  # Third plot
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 1 rows
  ncol = 3,  # Arrange the plots in 3 column
  common.legend = T  # Include a legend in the combined figure
)
figure2

# Question 6
# Push to Github



