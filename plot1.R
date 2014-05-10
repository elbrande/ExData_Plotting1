library(data.table)
colClasses <- c("character","character","character","character","character","character","character","character","character")
P <- fread("../data/household_power_consumption.txt", header=TRUE, sep=";", na.strings=c('?',NULL), colClasses = colClasses)

PP <- subset(P, Date %in% c('1/2/2007','2/2/2007'))
x <- PP$Global_active_power

x <- as.numeric(x)

par(mar=c(5,1,1,1))

png("plot1.png", width = 480, height = 480 )
hist(x, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")


dev.off()