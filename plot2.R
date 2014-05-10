library(data.table)
colClasses <- c("character","character","character","character","character","character","character","character","character")
P <- fread("../data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c('?',NULL), colClasses = colClasses)

PP <- subset(P, Date %in% c('1/2/2007','2/2/2007'))
y <- PP$Global_active_power
 
x <- strptime(paste(PP$Date,PP$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")


par(mar=c(2,5,1,1))

png("plot2.png", width = 480, height = 480 )
plot(x,y, type="n", main="", ylab="Global Active Power (kilowatts)", xlab="")
lines(x,y)

dev.off()