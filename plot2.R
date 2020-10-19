data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- na.omit(data)
data$DateTimeRaw <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- as.POSIXct(data$DateTimeRaw, tz = "","%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power~data$DateTime, type="l", xlab="", ylab="Global active power (kilowatts)")
dev.off() 