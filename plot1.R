## This file is to describe the steps to create the plots of Assignment xxx
## Load required libraries

## Load household energy consumption data
powcon <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", nrows = 2075259, stringsAsFactors = FALSE)

## Subset energy consumption data 
powcon1 <- powcon[powcon$Date == "1/2/2007" | powcon$Date =="2/2/2007",]

## Format strings to dates
powcon1$Datetime <- strptime(paste(powcon1$Date, powcon1$Time), format="%d/%m/%Y %H:%M:%S")

## Create Plot 1 - histogram
# Open png graphics device

png(file ="plot1.png")
# plot histogram
hist(powcon1$Global_active_power, col="red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")

#close graphics device
dev.off()
