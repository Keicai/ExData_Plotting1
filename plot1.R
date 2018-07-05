## read data table
dataset <- read.table("household_power_consumption.txt", skip =1, sep=";")
colnames(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]

## data formatting

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## create histogram

hist(data$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## output data to png

png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()