## Coursera Class
## Exploratory Data Analysis
##
## June 5, 2014     Initial Version     E.Conde
##

## This R file utilizes the household power consumption data provided by
## UC Irvine Machine Learning Repository http://archive.ics.uci.edu/ml/
## and will plot global power consumption from 2007-02-01 to 2007-02-02


## download data file
setwd("C:\\Users\\Eduardo\\SkyDrive\\Documents\\Coursera\\Exploratory Data Analysis\\Assignment 1\\ExData_Plotting1")
fileName <- "household_power_consumption.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL,fileName, mode="wb")
dateDownloaded <- date()
unzip(fileName)
fileName <- "household_power_consumption.txt"

## load data into data frame and filter data
fullDataSet <- read.csv(fileName, sep = ";", na.strings = "?")
data <- subset(fullDataSet, as.Date(strptime(fullDataSet$Date, "%d/%m/%Y")) >= "2007-02-01" &
                   as.Date(strptime(fullDataSet$Date, "%d/%m/%Y")) <= "2007-02-02")              
## unload master data as is no longer needed
rm (fullDataSet)

## add column to combine Time and Date into a single variable
data$dateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

## Plot and save to plot4.png
png(filename="plot4.png", width=480, height=480)
plot(data$dateTime, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

plot(data$dateTime, data$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering", main="")
lines(data$dateTime, data$Sub_metering_2, col="red")
lines(data$dateTime, data$Sub_metering_3, col="blue")
legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$dateTime, data$Voltage, type="l", col="black", xlab="dateTime", 
     ylab="Voltage", main="")

plot(data$dateTime, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()