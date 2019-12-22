# Plot2.R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electricity.zip")
unzip("electricity.zip")

data1 <- fread("household_power_consumption.txt", na.strings = "?")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data2 <- data1[Date >= "2007-02-01" & Date <= "2007-02-02",,]
#data2$Time <- as.ITime(data2$Time) #still experimental
data2$Time <- as.POSIXct(paste(as.character(data2$Date), data2$Time))

plot(data2$Time, data2$Global_active_power, type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot2.png", width=480, height=480)
dev.off()
