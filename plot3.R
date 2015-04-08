# loading the data

data <- read.table("household_power_consumption.txt",
                   sep = ";", header = T, na.strings = "?")

# formatting date and time values

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "),
                      format = "%Y-%m-%d %H:%M:%S")

# limiting the data to 2 days only

data2 <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# plot 3

png(filename = "plot3.png", width = 480, height = 480)

with(data2, {
    plot(Time, Sub_metering_1, type = "n",
         xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_1, col = "black")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
})
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()