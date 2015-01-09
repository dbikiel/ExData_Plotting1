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
hist(data_trim$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Plot in PNG
png(file="Plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data_trim$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

