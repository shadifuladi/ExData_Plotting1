# laod/clean data

raw_data <- read.csv("household_power_consumption.txt", sep = ';')

data <- subset(raw_data, raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007")
data$Date <- as.Date (data$Date, '%d/%m/%Y' )
format(Sys.time(), "%H:%M:%S")
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time))) #, "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#plot 3
dev.new()

plot(data$timestamp, data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 ") ,lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height= 480)

dev.off()
