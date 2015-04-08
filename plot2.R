# loading the data

data <- read.table("household_power_consumption.txt",
                   sep = ";", header = T, na.strings = "?")

# formatting date and time values

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "),
                      format = "%Y-%m-%d %H:%M:%S")

# limiting the data to 2 days only

data2 <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# plot 2

png(filename = "plot2.png", width = 480, height = 480)

with(data2,
     plot(Time, Global_active_power, type = "l",
          xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()