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

# Plot 1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

hist(sub_data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()