##load package
library(dplyr)

##read data from file
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

plot_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


##create plot 1 and save to png

png(filename = "plot1.png", width = 480, height = 480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(plot_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
