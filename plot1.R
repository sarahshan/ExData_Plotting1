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

#drawing plot1 and saving as a png in working directory
png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")

hist(subset$Global_active_power,col="Red", main = "Global Active Power", 
     xlab ="Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()