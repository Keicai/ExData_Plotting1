## read data table
dataset <- read.table("household_power_consumption.txt", skip =1, sep=";")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]

## data formatting

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

## plot data

plot_col <- c("black","red","blue") ## plot colors

plot(data$Datetime, data$Sub_metering_1, type = 'l', col = plot_col[1], xlab ="", ylab ="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type = 'l', col = plot_col[2])
lines(data$Datetime, data$Sub_metering_3, type = 'l', col = plot_col[3])
legend("topright", names(data[7:9]), col = plot_col, lty = 1, cex = 0.8)


## output data to png

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()


