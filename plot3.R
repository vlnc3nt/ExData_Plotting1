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

# Plot 3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

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
       lty=1,
       col=c("black","red","blue"))


dev.off()