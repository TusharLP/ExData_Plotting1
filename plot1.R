###############Reading the data###################
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE)

###############Changing to Date format############
data$Date <- as.Date(data$Date, "%d/%m/%Y")

###############Subsetting the data to required days#######
data <- subset(data, as.character(data$Date) == "2007-02-01"|as.character(data$Date) == "2007-02-02")

##############Changing to numeric################
data$Global_active_power <- as.numeric(data$Global_active_power)

###############Plotting the graph in PNG format#############
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()