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
#png("Plot4.png", width=480, height=480)
png("Plo4.png", width=480, height=480)
par(mfrow=c(2,2))
with(rdata,plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)"))
with(rdata,plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                Voltage,type="l",xlab="datetime",ylab="voltage"))
plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
     rdata$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
      rdata$Sub_metering_2,type="l",col="red")
lines(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
      rdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col = c("black","red","blue"),lty=1,cex=.6)
with(rdata,plot(strptime(paste0(rdata$Date,rdata$Time),format="%Y-%m-%d %H:%M:%S"),
                Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.copy(png,file="Plot4.png")
dev.off()
