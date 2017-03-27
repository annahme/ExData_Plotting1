## This file is to describe the steps to create the plots of Assignment xxx
## Load required libraries

## Load household energy consumption data
powcon <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", nrows = 2075259, stringsAsFactors = FALSE)

## Subset energy consumption data 
powcon1 <- powcon[powcon$Date == "1/2/2007" | powcon$Date =="2/2/2007",]

## Format strings to dates
powcon1$Datetime <- strptime(paste(powcon1$Date, powcon1$Time), format="%d/%m/%Y %H:%M:%S")

## Create Plot 2
# Open png graphics device

png(file ="plot2.png")

# plot chart
par(mfrow=c(1,1))
plot(powcon1$Datetime, powcon1$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(powcon1$Datetime, powcon1$Global_active_power)


#close graphics device
dev.off()
