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
