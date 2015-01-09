setwd("/Users/dbikiel/Documents/R/Coursera/Exploratory/")
wd <- getwd()

#Collect the name of the variables from the total Table
data_1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
c <- colnames(data_1)

#Collect just the data that will be analyzed
data_trim <- read.table("household_power_consumption.txt", 
                        col.names = c , sep = ";",  skip = 66637, nrows = 2880, na.strings="?")

#Omit NA data and convert Date to proper format
Dates <- as.Date(data_trim$Date, format="%d/%m/%Y")
Times <- data_trim$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data_full <- data_trim
data_full$DateTime <- DateTime
data_clean <- na.omit(data_full)

#Plot in screen
par(mfrow = c(2,2))
plot(data_clean$DateTime,data_clean$Global_active_power, 
     type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data_clean$DateTime,data_clean$Voltage, 
     type = "l", xlab="datetime", ylab="Voltage")

plot(data_clean$DateTime,data_clean$Sub_metering_1, 
     type = "n", xlab="", ylab="Energy sub metering")
lines(data_clean$DateTime,data_clean$Sub_metering_1, col="black")
lines(data_clean$DateTime,data_clean$Sub_metering_2, col="blue")
lines(data_clean$DateTime,data_clean$Sub_metering_3, col="red")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"), lty=c(1,1,1), pt.cex=1, cex=1, xjust=1)

plot(data_clean$DateTime,data_clean$Global_reactive_power, 
     type = "l", xlab="Datetime", ylab="global_reactive_power")

#Plot in PNG
png(file="Plot4.png", width = 480, height = 480, units = "px", bg ="transparent")
par(mfrow = c(2,2))
plot(data_clean$DateTime,data_clean$Global_active_power, 
     type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data_clean$DateTime,data_clean$Voltage, 
     type = "l", xlab="datetime", ylab="Voltage")

plot(data_clean$DateTime,data_clean$Sub_metering_1, 
     type = "n", xlab="", ylab="Energy sub metering")
lines(data_clean$DateTime,data_clean$Sub_metering_1, col="black")
lines(data_clean$DateTime,data_clean$Sub_metering_2, col="blue")
lines(data_clean$DateTime,data_clean$Sub_metering_3, col="red")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"), lty=c(1,1,1), pt.cex=1, cex=1, xjust=1)

plot(data_clean$DateTime,data_clean$Global_reactive_power, 
     type = "l", xlab="Datetime", ylab="global_reactive_power")
dev.off()