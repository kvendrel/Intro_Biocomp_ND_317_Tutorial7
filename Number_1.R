#load the data table
fasta=scan(file="Lecture11.fasta", what=character())

head(fasta)

#create an empty matrix to become the summary table with 4 columns
summ=matrix(NA,length(fasta)/2,4)

#for loop to assign values to the summary table from the DNA table
for(i in 1:length(fasta)) {
  if(grepl(">",fasta[i])){
    summ[((i+1)/2),1]=substr(fasta[i],2,nchar(fasta[i])) # could use counter instead of complicated row calculation
  }else{
    seqLength=nchar(fasta[i])
    
    numG=nchar(fasta[i])-nchar(gsub("G","",fasta[i]))
    numC=nchar(fasta[i])-nchar(gsub("C","",fasta[i]))
    if(seqLength<=14){
      Tm=2*(numG+numC)+2*seqLength
    }else{
      Tm=-9999
    }
    
    summ[i/2,2]=seqLength
    summ[i/2,3]=round((numG+numC)/seqLength*100,1)
    summ[i/2,4]=Tm
  }
}

seqSumm=data.frame(sequenceID=summ[,1],sequenceLength=as.numeric(summ[,2]),percentGC=as.numeric(summ[,3]),meltingTemp=as.numeric(summ[,4]))

#create a histogram of seq length
library(ggplot2)
library(grid)
library(gridExtra)
a=ggplot(data=seqSumm,aes(x=sequenceLength))
c=a+geom_histogram(binwidth=5,fill="blue",color="black")+theme_classic()+xlab("sequence lengths")+ylab("count")

#create a histogram of GC content of the sequences
b=ggplot(data=seqSumm,aes(x=percentGC))
d=b+geom_histogram(binwidth=5,fill="cadetblue",color="chartreuse")+theme_classic()

#put the two plots side by side
grid.arrange(c,d,ncol=2)
