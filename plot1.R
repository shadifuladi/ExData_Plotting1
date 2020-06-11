# laod/clean data

raw_data <- read.csv("household_power_consumption.txt", sep = ';')

data <- subset(raw_data, raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007")
data$Date <- as.Date (data$Date, '%d/%m/%Y' )
format(Sys.time(), "%H:%M:%S")
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time))) #, "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)


# plot 1
dev.new()

hist(data$Global_active_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", width=480, height= 480)

dev.off()