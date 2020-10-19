data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- na.omit(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 