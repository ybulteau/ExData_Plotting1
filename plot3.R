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
png("plot3.png")
plot(data2$FullDate, data2$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data2$FullDate, data2$Sub_metering_2, col = "red")
lines(data2$FullDate, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
