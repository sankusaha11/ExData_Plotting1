
#Generating Plot#4

setwd("C:/Users/ssaha/Desktop/Personal/coursera/ExploratoryAnalysis")
rm(list=ls())

mydf <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE) 
mydf$Date <- as.Date(mydf$Date,"%d/%m/%Y")
mydf2days <- subset(mydf, Date == as.Date("2007-02-01")| Date == as.Date("2007-02-02"))
mydf2days$Global_active_power <- as.numeric(mydf2days$Global_active_power)


mydf2days$dt <- paste(mydf2days$Date, mydf2days$Time)
mydf2days$dt <- strptime(mydf2days$dt,"%Y-%m-%d %H:%M:%S")



png("plot4.png")

par(mfrow = c(2,2))

with(mydf2days, plot(dt,Global_active_power,type="l", ylab = "Global Active Power",xlab=""))

with(mydf2days, plot(dt,Voltage,type="l", ylab = "Voltage",xlab="datetime"))

with(mydf2days,plot(dt,Sub_metering_1, col= "black", type="l",ylab= "Energy sub metering"))
lines(mydf2days$dt, mydf2days$Sub_metering_2, col="red", type="l")
lines(mydf2days$dt, mydf2days$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

with(mydf2days, plot(dt,Global_reactive_power,type="l", ylab = "Global_reactive_power",xlab="datetime"))


dev.off()



