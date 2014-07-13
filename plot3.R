#####Read in data file and convert Date variable from a factor to a date 

data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format = '%d/%m/%Y')

### paste Date and time together
data$datetime <- paste(data$Date, data$Time)

###  Subset data to include only the two days of interest
data2 <- subset(data, Date == as.Date('2007-02-01', format = '%Y-%m-%d') | Date == as.Date('2007-02-02', format = '%Y-%m-%d'))

###  Change the class of the pasted Date and Time variable from character to time

data2$datetime<-strptime(data2$datetime, format = '%Y-%m-%d %H:%M:%S')

###Create PNG file and create graph

png("plot3.png")
with(data2, plot(datetime,Sub_metering_1,type ="l", xlab="",ylab="Energy sub metering"))
##Add additional lines to graph
with(data2, lines(datetime, Sub_metering_2, col="red"))
with(data2, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
