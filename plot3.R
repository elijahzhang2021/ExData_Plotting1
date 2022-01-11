##load package
library(dplyr)

##download data
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile=paste0(getwd(),"/Power_consumption.zip"),method = "curl")
unzip("Power_consumption.zip")

##Read first 5 rows to get headers
initial<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)

##Load data
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630,col.names=names(initial), na.strings=c("?"),
                   colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"))

##add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

plot_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


##create plot 3

png("plot3.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(plot_data$DateTime, plot_data$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(plot_data$DateTime, plot_data$Sub_metering_2, type="l", col = "red")
lines(plot_data$DateTime, plot_data$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(plot_data)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()