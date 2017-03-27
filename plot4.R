## This file is to describe the steps to create the plots of Assignment xxx
## Load required libraries

## Load household energy consumption data
powcon <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", nrows = 2075259, stringsAsFactors = FALSE)

## Subset energy consumption data 
powcon1 <- powcon[powcon$Date == "1/2/2007" | powcon$Date =="2/2/2007",]

## Format strings to dates
powcon1$Datetime <- strptime(paste(powcon1$Date, powcon1$Time), format="%d/%m/%Y %H:%M:%S")

## Create Plot 4
# Open png graphics device

png(file ="plot4.png")

# plot chart
par(mfrow=c(2,2))
# plot first diagramm
plot(powcon1$Datetime, powcon1$Global_active_power, ylab = "Global Active Power", xlab="", type="n")
lines(powcon1$Datetime, powcon1$Global_active_power)

#plot Voltage diagram
plot(powcon1$Datetime, powcon1$Voltage, ylab = "Voltage", xlab="datetime", type="n")
lines(powcon1$Datetime, powcon1$Voltage)

#Plot sub metering diagram
plot(powcon1$Datetime, powcon1$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n")
lines(powcon1$Datetime, powcon1$Sub_metering_1)
lines(powcon1$Datetime, powcon1$Sub_metering_2, col="red")
lines(powcon1$Datetime, powcon1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")


#close graphics device#plot global reactive power diagram
plot(powcon1$Datetime, powcon1$Global_reactive_power, ylab = "Gloal_reactive_power", xlab="datetime", type="n")
lines(powcon1$Datetime, powcon1$Global_reactive_power)

dev.off()