# Plot4.R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electricity.zip")
unzip("electricity.zip")

data1 <- fread("household_power_consumption.txt", na.strings = "?")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data2 <- data1[Date >= "2007-02-01" & Date <= "2007-02-02",,]
#data2$Time <- as.ITime(data2$Time) #still experimental
data2$Time <- as.POSIXct(paste(as.character(data2$Date), data2$Time))

par(mfrow=c(2,2))
with(data2, {
  #(1,1)
  plot(data2$Time, data2$Global_active_power, type = "l", 
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  #(1,2)
  plot(data2$Time, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  #(2,1)
  with(data2, {
    plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(Time, Sub_metering_1, type = "l")
    points(Time, Sub_metering_2, type = "l", col = "red")
    points(Time, Sub_metering_3, type = "l", col = "blue")
    legend(x="topright", lwd = 1, bty="n", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  #(2,2)
  plot(data2$Time, data2$Global_reactive_power, type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power")
})
dev.copy(png, file = "Plot4.png", width=480, height=480)
dev.off()
