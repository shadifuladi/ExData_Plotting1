# laod/clean data

raw_data <- read.csv("household_power_consumption.txt", sep = ';')

data <- subset(raw_data, raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007")
data$Date <- as.Date (data$Date, '%d/%m/%Y' )
format(Sys.time(), "%H:%M:%S")
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time))) #, "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

#plot
dev.new()
par (mfrow=c(2,2))

#plot 1

plot(data$timestamp,data$Global_active_power,type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#plot 2
plot(data$timestamp,data$Voltage, type="l", xlab="datetime", ylab="voltage")

# plot 3 
plot(data$timestamp, data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright","left", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ") ,
       lty=1, lwd =1, bty="n")
# plot 4
plot (data$timestamp, data$Global_reactive_power, type="l", 
      xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height= 480)

dev.off()