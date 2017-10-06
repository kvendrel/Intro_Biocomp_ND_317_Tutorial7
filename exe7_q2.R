library(ggplot2)
setwd("C:/Users/DAVIS/Desktop/shell-novice-data/exe7/")
wages <- read.csv("wages.csv", header=TRUE)
f <- ggplot(wages, aes(wages$yearsExperience, wages$wage))
f + geom_point()+stat_smooth(method = "lm")

f <- ggplot(wages, aes(wages$yearsExperience, log10(wages$wage)))
f + geom_point()+stat_smooth(method = "lm")


