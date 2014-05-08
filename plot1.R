setwd("c:/users/sak/desktop/r learning")
src<- "household_power_consumption.txt"
data <- read.csv2(src, skip=66637, nrows=2880,stringsAsFactors=FALSE)
names <- read.csv2(src, nrows=1)
colnames(data) <- colnames(names)
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480, bg ="NA")
hist(data$Global_active_power, 
     col="red", 
     main= "Global Active power",
     xlab="Global Active Power (kilowatts)" )
dev.off()