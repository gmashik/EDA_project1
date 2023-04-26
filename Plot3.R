library(dplyr)
#Reading table
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
rdata<-dt %>% filter(Date >= "2007-02-01" & Date<= "2007-02-02")
windows.options(width=20, height=20)
dt$Time<-strptime(dt$Time,"%H:%M:%S")
# plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
#      rdata$Sub_metering_1,type="n")
png("Plot3.png", width=480, height=480)
plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                rdata$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                rdata$Sub_metering_2,type="l",col="red")
lines(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
      rdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col = c("black","red","blue"),lty=1)
dev.copy(png,file="Plot3.png")
dev.off()
