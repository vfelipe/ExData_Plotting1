
# Load input file
f1 <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE);

# Convert Datatypes, get only Feb 1-2, 2007
f1$Date <- as.Date(f1$Date, format="%d/%m/%Y")
f2 <- subset(f1, Date>= "2007-02-01" & Date<="2007-02-02")
f2$Global_active_power <- as.numeric(f2$Global_active_power)

# Use hist function
hist(f2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save as png file
dev.copy(png, "plot1.png")
dev.off()