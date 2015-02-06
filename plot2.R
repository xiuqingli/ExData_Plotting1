source("load-data.R")
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# To get weekday in English
Sys.setlocale("LC_TIME", "C")
## Plot 2
png("plot2.png", height = 480, width = 480)
plot(data$Global_active_power~data$Datetime, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()