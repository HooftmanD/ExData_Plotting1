data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- na.omit(data)
data$DateTimeRaw <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- as.POSIXct(data$DateTimeRaw, tz = "","%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Plot 1
plot(data$Global_active_power~data$DateTime, type="l", xlab="", ylab="Global active power (kilowatts)")

# Plot 2
plot(data$Voltage~data$DateTime, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(data$Sub_metering_1~data$DateTime, type="l", xlab="", ylab="Energy sub meetering")
lines(data$Sub_metering_2~data$DateTime, type="l", col="red")
lines(data$Sub_metering_3~data$DateTime, type="l", col="blue")
legend(x = "topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1))

# Plot 4
plot(data$Global_reactive_power~data$DateTime, type="l", xlab="datetime")

dev.off() 