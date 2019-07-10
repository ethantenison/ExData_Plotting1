#plot 3 
library(dplyr)
library(janitor)
library(lubridate)
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- clean_names(data)

data$date <- as.character(data$date)
data$time <- as.character(data$time)
data <- filter(data, date == "1/2/2007" | date == "2/2/2007")
data$datetime <- paste(data$date, data$time, sep = " ")
data$datetime <- dmy_hms(data$datetime)

#plot 3
png("plot3.png", width = 480, height = 480)
plot(data$datetime, data$sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$datetime, data$sub_metering_2, col = "blue")
lines(data$datetime, data$sub_metering_3, col = "magenta")
legend("topright", legend = c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"), col = c("black", "blue", "magenta"), lty = 1)
dev.off()