##load package
library(dplyr)

##read data from file
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

plot_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


##create plot 2

png(filename = "plot2.png", width = 480, height = 480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
plot(plot_data$DateTime, plot_data$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()