## EXPLORATORY DATA ANALYSIS 
## Course project 1 : Base plotting system. Plot 2 Exercise

# This code assumes that the dataset file in unzipped in the working directory.
# Is important to use "stringsAsFactors=F" in read.table in order to get the 
# data as characters. This makes right the conversion to numeric needed for hist

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# I have to plot Global active power vs time.  
# Date and time must be together and formatted
FechaHora <-paste(subdata$Date, subdata$Time) 
FechaHora <- strptime(FechaHora, format="%d/%m/%Y %H:%M:%S")

# Configure local configuration to English. If no, week days are in spanish.
Sys.setlocale("LC_TIME", "English")


#Sending the graphics directly to the device is more effective and best drawed: 
png("plot2.png")
plot(FechaHora, subdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

# Close device:
dev.off()