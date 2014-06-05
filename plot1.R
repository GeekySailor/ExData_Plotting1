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
    
## Plot and save to plot1.png
    png(filename="plot1.png", width=480, height=480)
    hist(data$Global_active_power, main="Global Active Power",
         xlab="Global Active Power (kilowatts)", col="red")
    dev.off()
    
