library(RCurl)
#Reading the data from Secure link using getURL function from RCurl package
#Putting URL address into the object
UrlAddress.3.1<-paste0("https://raw.githubusercontent.com/jrwolf/IT497/master/fitstats.csv")

#Downloading the fitstats data
DataUrl.3.1<-getURL(UrlAddress.3.1)

#Converting data into data frame
RawData.3.1<-read.csv(textConnection(DataUrl.3.1),header=T, sep=",", strip.white=TRUE)

#One row has an errenous text, so let's remove it.
RawData.3.1$Steps<- gsub("RT @JennMamaBear: 4,","", RawData.3.1$Steps)

#Converting second column from character to numeric data type
RawData.3.1$Steps<-as.numeric(RawData.3.1$Steps)

#Generating scatter plot with Miles on x-axis and Steps on y-axis
graph1<-ggplot(RawData.3.1, aes(x=Miles, y=Steps)) + geom_point(shape=1)
