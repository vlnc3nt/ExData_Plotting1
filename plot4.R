# Read data
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   colClasses=c(rep("character",2),rep("numeric",7)), 
                   sep=";",
                   na="?")


# Change Date variable to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the required data for 2007-02-01 & 2007-02-02  
sub_data <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

# Create a new variable that contain the date & time 
sub_data$DateTime <- strptime(paste(sub_data$Date,sub_data$Time),format="%Y-%m-%d %H:%M:%S")

# Plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow = c(2, 2))


# top left
plot(sub_data$DateTime, sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# top right
plot(sub_data$DateTime, sub_data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# bottom left
plot(x=sub_data$DateTime,
     y=sub_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(x=sub_data$DateTime,y=sub_data$Sub_metering_2, type="l",col="red")
lines(x=sub_data$DateTime,y=sub_data$Sub_metering_3, type="l",col="blue")

legendTxt <-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")

legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       cex = 0.9,
       bty = "n",
       col=c("black","red","blue"))

# bottom right
plot(sub_data$DateTime, sub_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()