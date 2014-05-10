library(data.table)
colClasses <- c("character","character","character","character","character","character","character","character","character")
P <- fread("../data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c('?',NULL), colClasses = colClasses)

PP <- subset(P, Date %in% c('1/2/2007','2/2/2007'))
y <- PP$Global_active_power
y1 <- PP$Sub_metering_1
y2 <- PP$Sub_metering_2
y3 <- PP$Sub_metering_3


x <- strptime(paste(PP$Date,PP$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")


#par(mar=c(3, 4, 1, 2))

png("plot4.png", width = 480, height = 480 )
par(mfrow=c(2,2))
par(mar = c(4, 4, 2, 1))
##top left 
plot(x,y, type="n", main="", ylab="Global Active Power (kilowatts)", xlab="")
lines(x,y)

##top rightd
plot(x,PP$Voltage, type="n", main="", ylab="Voltage", xlab="datetime")
lines(x,PP$Voltage)

##Bottom Left
plot(x,y1, type="n", main="", ylab="Energy sub metering", xlab="")
lines(x,y1, col="black")
lines(x,y2, col="red")
lines(x,y3, col="blue")
legend("topright", names(PP)[7:9],lty=1, col=c('black','red','blue'), bty='n')

##Bottom Right
plot(x,PP$Global_reactive_power, type="n", main="", ylab="Global_reactive_power", xlab="datetime")
lines(x,PP$Global_reactive_power)

dev.off()