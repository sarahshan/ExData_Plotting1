Sys.setlocale("LC_TIME", "English")

#importing data
data <- read.table("C:/User/U414825/Documents/Perso/Divers/Coursera/Exploratory Analysis/household_power_consumption.txt", 
                   header = TRUE, sep = ";", quote = "",
                   dec = ".", na.strings = "?")


#formatting date and time variables
data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S" )

#first check of the data
summary(data)
str(data)

#subsetting data to the days of 2007 Feb 1 and 2
subset<- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

#handling missing values
sum(is.na(subset))
#no missing values in the subset

#drawing plot4 and saving it as a png in working directory
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#topleft plot
plot(subset$Datetime, subset$Global_active_power,type = "l", col="Black", main = "", 
     xlab ="", ylab = "Global Active Power")

#topright plot
plot(subset$Datetime, subset$Voltage,type = "l", col="Black", main = "", 
     xlab ="datetime", ylab = "Voltage")

#bottomleft plot
plot(subset$Datetime, subset$Sub_metering_1,type = "l", col="Black", main = "", 
     xlab ="", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2,col="Red")
lines(subset$Datetime, subset$Sub_metering_3,col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c(1,2,4),lty=c(1,1,1),bty="n",cex=0.8)

#bottomright plot
plot(subset$Datetime, subset$Global_reactive_power,type = "l", col="Black", main = "", 
     xlab ="datetime", ylab = "Global_reactive_power")

dev.off()