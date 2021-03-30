#Downloading and unzip dataset
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
#unzip("data.zip")
library(dplyr)
library(lubridate)

#Reading data and select the dates
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data2 = data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Making a variable containing both date and time
data2 = mutate(data2, FullDate = paste(Date, Time)) 
data2$FullDate = dmy_hms(data2$FullDate)

#Plotting the data
#WEEKDAYS IN FRENCH BUT CORRESPOND TO THU, FRI AND SAT
png("plot4.png")

par(mfrow=c(2,2))
plot(data2$FullDate, data2$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

plot(data2$FullDate, data2$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

plot(data2$FullDate, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data2$FullDate, data2$Sub_metering_2, col = "red")
lines(data2$FullDate, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, box.lty = 0, bg = "transparent", cex = 0.9)

plot(data2$FullDate, data2$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()
