library(data.table)
colClasses <- c("character","character","character","character","character","character","character","character","character")
P <- fread("../data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c('?',NULL), colClasses = colClasses)

PP <- subset(P, Date %in% c('1/2/2007','2/2/2007'))
y1 <- PP$Sub_metering_1
y2 <- PP$Sub_metering_2
y3 <- PP$Sub_metering_3

x <- strptime(paste(PP$Date,PP$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")


par(mar=c(2,5,1,1))

png("plot3.png", width = 480, height = 480 )
plot(x,y1, type="n", main="", ylab="Enery sub metering", xlab="")
lines(x,y1, col="black")
lines(x,y2, col="red")
lines(x,y3, col="blue")
legend("topright", names(PP)[7:9],lty=1, col=c('black','red','blue'))

dev.off()