src<- "household_power_consumption.txt"
data <- read.csv2(src, skip=66637, nrows=2880,stringsAsFactors=FALSE)
names <- read.csv2(src, nrows=1)
colnames(data) <- colnames(names)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


png("plot3.png", width = 480, height = 480, bg ="NA")
plot(data$Date, data$Sub_metering_1, type="n",
     ylab="Energy sub metering",
     xlab="")
lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright",names(data)[7:9], lty=1, col=c("black", "red", "blue"))
dev.off()

