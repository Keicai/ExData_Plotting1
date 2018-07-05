## read data table
dataset <- read.table("household_power_consumption.txt", skip =1, sep=";")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]

## data formatting

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

## plot
plot_col <- c("black","red","blue") ## plot colors

par(mfrow = c(2,2))

plot(x = data$Datetime, y = data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
plot(x = data$Datetime, y = data$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")
plot(data$Datetime, data$Sub_metering_1, type = 'l', col = plot_col[1], xlab ="", ylab ="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type = 'l', col = plot_col[2])
lines(data$Datetime, data$Sub_metering_3, type = 'l', col = plot_col[3])
legend("topright", names(data[7:9]), col = plot_col, lty = 1, cex = 0.5, bty = "n")
plot(x = data$Datetime, y = data$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")        

## output png

dev.copy(png,"plot4.png", width=600, height=480)
dev.off()