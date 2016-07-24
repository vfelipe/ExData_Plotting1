
# Load input file
f1 <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE);

# Convert Datatypes, get only Feb 1-2, 2007
f1$Date <- as.Date(f1$Date, format="%d/%m/%Y")
f2 <- subset(f1, Date>= "2007-02-01" & Date<="2007-02-02")
f2$Global_active_power <- as.numeric(f2$Global_active_power)
f2$Global_reactive_power <- as.numeric(f2$Global_reactive_power)
f2$Voltage <- as.numeric(f2$Voltage)
f2$Sub_metering_1 <- as.numeric(f2$Sub_metering_1)
f2$Sub_metering_2 <- as.numeric(f2$Sub_metering_2)
f2$Sub_metering_3 <- as.numeric(f2$Sub_metering_3)

# Create new column containing Date and Time
f2$Date_Time <- paste(f2$Date, f2$Time, sep=" ")
f2$Date_Time <- strptime(f2$Date_Time, format="%Y-%m-%d %H:%M:%S")

# Set layout
par(mfcol=c(2,2), mar=c(5,4,1,2))

# plot Graph1
plot(x=f2$Date_Time, y=f2$Global_active_power, type = "l", ylab = "Global Active Power", xlab="")

# plot Graph2
plot(x=f2$Date_Time, y=f2$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", col="black")
lines(x=f2$Date_Time, y=f2$Sub_metering_2, type = "l", col="red")
lines(x=f2$Date_Time, y=f2$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, bty="n", cex=0.75)

# plot Graph3
plot(x=f2$Date_Time, y=f2$Voltage, type = "l", ylab = "Voltage", xlab="datetime")

# plot Graph4
plot(x=f2$Date_Time, y=f2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime")

# Save as png file
dev.copy(png, "plot4.png"
dev.off()