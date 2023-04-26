library(dplyr)
#Reading table
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
rdata<-dt %>% filter(Date >= "2007-02-01" & Date<= "2007-02-02")
windows.options(width=20, height=20)
dt$Time<-strptime(dt$Time,"%H:%M:%S")
png("Plot2.png", width=480, height=480)
with(rdata,plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="Plot2.png")
dev.off()