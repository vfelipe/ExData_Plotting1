
# Load input file
f1 <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE);

# Convert Datatypes, get only Feb 1-2, 2007
f1$Date <- as.Date(f1$Date, format="%d/%m/%Y")
f2 <- subset(f1, Date>= "2007-02-01" & Date<="2007-02-02")
f2$Global_active_power <- as.numeric(f2$Global_active_power)

# Create new column containing Date and Time
f2$Date_Time <- paste(f2$Date, f2$Time, sep=" ")
f2$Date_Time <- strptime(f2$Date_Time, format="%Y-%m-%d %H:%M:%S")

# Use plot function
plot(x=f2$Date_Time, y=f2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

# Save as png file
dev.copy(png, "plot2.png")
dev.off()