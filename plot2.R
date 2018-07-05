## read data table
dataset <- read.table("household_power_consumption.txt", skip =1, sep=";")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]

## data formatting

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## plot data

plot(x = data$Datetime, y = data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

## output data to png

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


