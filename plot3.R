## This file is to describe the steps to create the plots of Assignment xxx
## Load required libraries

## Load household energy consumption data
powcon <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", nrows = 2075259, stringsAsFactors = FALSE)

## Subset energy consumption data 
powcon1 <- powcon[powcon$Date == "1/2/2007" | powcon$Date =="2/2/2007",]

## Format strings to dates
powcon1$Datetime <- strptime(paste(powcon1$Date, powcon1$Time), format="%d/%m/%Y %H:%M:%S")

## Create Plot 3
# Open png graphics device

png(file ="plot3.png")

# plot chart
par(mfrow=c(1,1))
plot(powcon1$Datetime, powcon1$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n")
lines(powcon1$Datetime, powcon1$Sub_metering_1)
lines(powcon1$Datetime, powcon1$Sub_metering_2, col="red")
lines(powcon1$Datetime, powcon1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))


#close graphics device
dev.off()
