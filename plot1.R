## EXPLORATORY DATA ANALYSIS 
## Course project 1 : Base plotting system. Plot 1 Exercise

# This code assumes that the dataset file in unzipped in the working directory.
# Is important to use "stringsAsFactors=F" in read.table in order to get the 
# data as characters. This makes right the conversion to numeric needed for hist

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)

subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# I'm going to plot the histogram for the variable Global_active_power, wich is 
# column number 3:
x <- as.numeric(subdata[, 3])

#Sending the graphics directly to the device is more effective and best drawed: 
png("plot1.png")
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close device:
dev.off()