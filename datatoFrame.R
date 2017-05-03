#setwd("~/Dropbox/WeatherData")
rm(list=ls())
library(rjson)
library(httr)
library(devtools)
install_github("hadley/httr")
list.of.files<-dir()
list.of.files<-list.of.files[grep("json",list.of.files)]
number.of.json.files<-length(list.of.files)
dataframe<-list()
count.index<-0
latitude<-longitude<- altimeter <- barometerTrend<-barometerCode<-barometerChange<-dewPoint<-feelsLike<-gust<-humidity<-icon<-observationTime<- obsQualifierCode<-obsQualifierSeverity<-phrase<- precip24Hour<- snowDepth<- temperature<-temperatureMaxSince7am<-uvIndex<-uvDescription<- visibility<-windSpeed<- windDirCompass<-windDirDegrees<- list()
for (file.name.current in list.of.files)	
{
count.index<- count.index+1
w<-fromJSON(file=file.name.current)
coordinates<-w[[1]]
coord<-unlist(strsplit(coordinates,","))
latitude[count.index]<-as.numeric(coord[[1]]) 
longitude[count.index]<- as.numeric(coord[[2]])
altimeter [count.index]<- as.numeric(w[[2]][[1]])
barometerTrend[count.index]<- w[[2]][[2]]
barometerCode[count.index]<- as.numeric(w[[2]][[3]])
barometerChange[count.index]<- as.numeric( w[[2]][[4]])
dewPoint[count.index]<-as.numeric(  w[[2]][[5]])
feelsLike[count.index]<-as.numeric(  w[[2]][[6]])
gust[count.index]<- w[[2]][[7]]
humidity[count.index]<-as.numeric(  w[[2]][[8]])
icon[count.index]<- as.numeric(w[[2]][[9]])
observationTime[count.index]<- w[[2]][[10]]
obsQualifierCode[count.index]<-as.numeric( w[[2]][[11]])
obsQualifierSeverity[count.index]<-as.numeric( w[[2]][[12]])
phrase[count.index]<- w[[2]][[13]]
precip24Hour[count.index]<- as.numeric(w[[2]][[14]])
snowDepth[count.index]<- as.numeric(w[[2]][[15]])
temperature[count.index]<- as.numeric(w[[2]][[16]])
temperatureMaxSince7am[count.index]<-as.numeric( w[[2]][[17]])
uvIndex[count.index]<- as.numeric(w[[2]][[18]])
uvDescription[count.index]<- w[[2]][[19]]
visibility[count.index]<-as.numeric( w[[2]][[20]])
windSpeed[count.index]<- as.numeric(w[[2]][[21]])
windDirCompass[count.index]<- w[[2]][[22]]
windDirDegrees[count.index]<- as.numeric(w[[2]][[23]])
dataframe<-cbind(latitude,longitude,altimeter,barometerTrend,barometerCode,barometerChange,dewPoint,feelsLike,gust,humidity,icon, observationTime,obsQualifierCode,obsQualifierSeverity,phrase,precip24Hour,snowDepth,temperature,temperatureMaxSince7am,uvIndex,uvDescription,visibility,windSpeed,windDirCompass,windDirDegrees)
}
head(dataframe)
# test1<-toJSON(dataframe)
# cat(test1)
rep<- POST(url = "https://www.dropbox.com/home/testforR",body=list(dataframe),encode = "json",verbose())
# save(dataframe,file="W13-01-2017.Rdata")
# write.csv(dataframe,file = "Weather13-01-2017.csv")

