source("load-data.R")

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# To get weekday in English
Sys.setlocale("LC_TIME", "C")
## plot3
png("plot3.png", height = 480, width = 480)
with(data, {
    plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2~Datetime, col = "red")
    lines(Sub_metering_3~Datetime, col = "blue")
})
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()