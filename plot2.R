#plot 2 
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


#plot 2
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", col= "limegreen")
dev.off()