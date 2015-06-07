#Plot 2

# Read data
epc_file <- "household_power_consumption.txt"
data_set <- read.table(epc_file, header = TRUE, sep = ";", na.strings = "?")

#Adjust the Date & create DateTime to create the graphic 
data_set$Date = as.Date(data_set$Date, "%d/%m/%Y")
data_set$DateTime = strptime((paste(data_set$Date, data_set$Time, sep="-")), format="%Y-%m-%d-%H:%M:%S")

# Subset
data_subset <- subset(data_set, Date <= as.Date("2007-02-02") & Date >= as.Date("2007-02-01"))

#Start making the graphic
png("plot2.png")
plot(data_subset$DateTime, 
     as.numeric(data_subset$Global_active_power), 
     ylab = "Global Active Power (kilowats)",
     xlab = "",
     type = "l")
dev.off()