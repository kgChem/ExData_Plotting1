library(dplyr)
#Read data from file. From first reading chunks of 10000, data of interest starts 
#beyond row 60000
power<-read.table('household_power_consumption.txt',skip=60000, nrows=10000, sep=";",
                  na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)),
                  col.names=c("Date","Time","GlobalActivePower","GlobalReactivePower",
                              "Voltage","GlobalIntensity","SubMetering1","SubMetering2",
                              "SubMetering3"))
power<-tbl_df(power)
power<-filter(power, Date =="1/2/2007" | Date == "2/2/2007")
power<-mutate(power, Date = as.Date(Date,"%d/%m/%Y"))
power<-mutate(power, Time = as.POSIXct(strptime(Time,"%H:%M:%S")))

#Fix date offset in the time field
offset<-(as.POSIXct(power$Date[1])-power$Time[1])+0.333334
offset<-c(rep(offset,1440),rep(offset+1,1440))
power<-mutate(power, Time = Time + offset*60*60*24)

#Generate plot 4 - A series of 4 plots 
png(filename = "plot4.png", width = 480, height = 480)
# Set paramaters
par(mfrow=c(2,2),mar = c(4,5,3,2),cex.axis=0.8,cex.lab=0.8,cex.main=.9)

# Make first plot
plot(power$GlobalActivePower~power$Time,ylab="Global Active Power",xlab="",
     type="l")

# Make second plot
plot(power$Voltage~power$Time,xlab="datetime",ylab="Voltage",type="l")

# Make third plot
plot(power$SubMetering1~power$Time,ylab="Energy sub metering",xlab="",
     type="l")
lines(power$Time,power$SubMetering2,col="red")
lines(power$Time,power$SubMetering3,col="blue")
legend(legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), "topright",
       lty=c(1,1,1),col=c("black","red","blue"),cex=.8,bty='n')

# Make fourth plot
plot(power$GlobalReactivePower~power$Time,ylab="Global_reactive_power",xlab="datetime",
     type="l")
dev.off()
