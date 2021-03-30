
#Downloading and unzip dataset
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
#unzip("data.zip")

#Reading data and select the dates
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data2 = data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Plotting the data
png("plot1.png")
hist(as.numeric(data2$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
