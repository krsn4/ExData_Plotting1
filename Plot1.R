# Plot1.R
getwd()
library(data.table)
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electricity.zip")
unzip("electricity.zip")

data1 <- fread("household_power_consumption.txt", na.strings = "?")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data2 <- data1[Date >= "2007-02-01" & Date <= "2007-02-02",,]
data2$Time <- as.ITime(data2$Time) #still experimental

hist(data2$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.copy(png, file = "Plot1.png", width=480, height=480)
dev.off()

