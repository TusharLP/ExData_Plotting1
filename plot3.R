###############Reading the data###################
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE)

###############Changing to Date format############
data$Date <- as.Date(data$Date, "%d/%m/%Y")

###############Subsetting the data to required days#######
data <- subset(data, as.character(data$Date) == "2007-02-01"|as.character(data$Date) == "2007-02-02")

##############Changing to numeric################
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


###############Creating new feature##############
data$DateTime <-  strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")




###############Plotting the graph in PNG format#############
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type = "l", col = "black")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()