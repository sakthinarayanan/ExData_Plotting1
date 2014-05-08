src<- "household_power_consumption.txt"
data <- read.csv2(src, skip=66637, nrows=2880,stringsAsFactors=FALSE)
names <- read.csv2(src, nrows=1)
colnames(data) <- colnames(names)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, bg ="NA")
plot(data$Date, data$Global_active_power, type="n", 
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(data$Date, data$Global_active_power)
dev.off()
