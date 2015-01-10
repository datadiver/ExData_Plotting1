## EXPLORATORY DATA ANALYSIS 
## Course project 1 : Base plotting system. Plot 3 Exercise

# This code assumes that the dataset file is unzipped in the working directory.
# Is important to use "stringsAsFactors=F" in read.table in order to get the 
# data as characters. This makes right the conversion to numeric needed for hist

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# I have to plot several graphics together about submeterings.
# Date and time must be together and formatted
FechaHora <-paste(subdata$Date, subdata$Time) 
FechaHora <- strptime(FechaHora, format="%d/%m/%Y %H:%M:%S")

# Configure local configuration to English. If no, week days are in spanish.
Sys.setlocale("LC_TIME", "English")

#Sending the graphics directly to the device is more effective and best drawed: 
png("plot3.png")
with (subdata, plot(FechaHora, Sub_metering_1, type="l", xlab="",
                    ylab="Energy sub metering"))
with(subdata, lines(FechaHora, Sub_metering_2, col="red"))
with(subdata, lines(FechaHora, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),)

# Copy the plot generated to a file .png:
# dev.copy(png, file="plot3.png")
dev.off()