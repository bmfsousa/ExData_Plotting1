#Plot 1

# Read data
epc_file <- "household_power_consumption.txt"
data_set <- read.table(epc_file, header = TRUE, sep = ";", na.strings = "?")

#Adjust the Date
data_set$Date = as.Date(data_set$Date, "%d/%m/%Y")

# Subset
data_subset <- subset(data_set, Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01"))

#Start making the graphic
png("plot1.png")
hist(data_subset$Global_active_power, 
     xlab = "Global Active Power (kilowats)",
     col = "red",
     main="Global Active Power")
dev.off()