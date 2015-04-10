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
power<-mutate(power, Time = Time + offset)

#Generate plot 1
png(filename = "plot1.png", width = 480, height = 480, bg = "white", untis = "px")
par(mar = c(6,6,5,4),cex.axis=0.75,cex.lab=0.75,cex.main=.9,lab=c(3,6,1),yaxp=c(0,1200,5))
hist(power$GlobalActivePower,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
