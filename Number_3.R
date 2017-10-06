#load and save data table as "data"
data=read.csv("data.txt",header=TRUE)

#make a barplot of the means of the four populations
y=ggplot(data)
y+geom_bar(aes(x=as.factor(region),y=observations),stat="summary",fun.y="mean")+xlab("region")

#make a scatterplot of all of the observations
k=ggplot(data)
k+geom_point(aes(x=as.factor(region),y=observations))+xlab("region")

#try "jittering" the points
k+geom_jitter(aes(x=as.factor(region),y=observations,alpha=0.01))+xlab("region")

#change the alpha argument
k+geom_point(aes(x=as.factor(region),y=observations,alpha=0.01))+xlab("region")

#yes the barplot and the scatterplot tell different stories, only looking at the mean
#(when we use barplot) hides the very different ranges of observations that we see in
#each of the regions. The means are all around 15, but when we look at the scatterplot
#we are able to see how the south has a very different distribution (looks like 2 separate
#populations) and the north has very concentrated range of observations versus the east and west
#which are more spread out. Only looking at the mean of each region hides the variability in
#the individual observations that we can see in the scatterplot