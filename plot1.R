# loading the data

data <- read.table("household_power_consumption.txt",
                   sep = ";", header = T, na.strings = "?")

# formatting date and time values

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time, sep = " "),
                      format = "%Y-%m-%d %H:%M:%S")

# limiting the data to 2 days only

data2 <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# plot 1

png(filename = "plot1.png", width = 480, height = 480)

with(data2,
     hist(Global_active_power,
          xlab= "Global Active Power (kilowatts)",
          col = "red", main = "Global Active Power"))

dev.off()