#loading RCurl for reading data from a secure link
library(RCurl)

#Loading ggplot2 for the graph
library(ggplot2)

#Reading the data from Secure link using getURL function from RCurl package
#Putting URL address into an object
UrlAddress.3.2<-paste0("https://raw.githubusercontent.com/jrwolf/IT497/master/fitstats.csv")

#Downloading the fitstats data
DataUrl.3.2<-getURL(UrlAddress.3.2)

#Converting data into data frame
RawData.3.2<-read.csv(textConnection(DataUrl.3.2),header=T, sep=",", strip.white=TRUE)

#One row has an erroneous  text, so let's remove it.
RawData.3.2$Steps<- gsub("RT @JennMamaBear: 4,","", RawData.3.2$Steps)

#Converting second column from character to numeric data type
RawData.3.2$Steps<-as.numeric(RawData.3.2$Steps)

#Generating scatter plot with Steps on x-axis and Miles on y-axis
graph2<-ggplot(RawData.3.2, aes(x=Steps, y=Miles)) +
  geom_point(shape=1) +
  ggtitle("Scatter chart showing Steps Vs Miles"))


