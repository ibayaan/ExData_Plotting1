#####Read in data file and convert Date variable from a factor to a date 

data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format = '%d/%m/%Y')

###  Subset data to include only the two days of interest
data2 <- subset(data, Date == as.Date('2007-02-01', format = '%Y-%m-%d') | Date == as.Date('2007-02-02', format = '%Y-%m-%d'))

## Create PNG file and insert graph
png("plot1.png")
hist(data2$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()