
#Generating Plot#1 - Histogram of Global Active Power

setwd("C:/Users/ssaha/Desktop/Personal/coursera/ExploratoryAnalysis")
rm(list=ls())

mydf <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE) 
mydf$Date <- as.Date(mydf$Date,"%d/%m/%Y")
mydf2days <- subset(mydf, Date == as.Date("2007-02-01")| Date == as.Date("2007-02-02"))
mydf2days$Global_active_power <- as.numeric(mydf2days$Global_active_power)


mydf2days$dt <- paste(mydf2days$Date, mydf2days$Time)
mydf2days$dt <- strptime(mydf2days$dt,"%Y-%m-%d %H:%M:%S")



png("plot1.png")
hist(mydf2days$Global_active_power, xlab = "Global Active Power (killowatts)", col = "red", main = "Global Active Power")
dev.off()


