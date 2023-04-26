library(dplyr)
#Reading table
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
rdata<-dt %>% filter(Date >= "2007-02-01" & Date<= "2007-02-02")

png("Plot1.png", width=480, height=480)
hist(rdata$Global_active_power,col='red',main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="Plot1.png")
dev.off()

