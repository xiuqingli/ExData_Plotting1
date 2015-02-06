source("load-data.R")

## plot1
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()