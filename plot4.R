source("load-data.R")

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# To get weekday in English
Sys.setlocale("LC_TIME", "C")
## Plot 4
png("plot4.png", height = 480, width = 480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", ylab = "Global Active Power", xlab = "")
  
  plot(Voltage~Datetime, type= "l", ylab = "Voltage", xlab = "datetime")
  
  plot(Sub_metering_1~Datetime, type="l", ylab = "Global Active Power", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type = "l", ylab= "Global Rective Power", xlab = "datetime")
})

dev.off()