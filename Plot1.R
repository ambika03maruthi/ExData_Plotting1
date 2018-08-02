setwd("~/Desktop/CE/Data Exploratory Analytics/Week1 Assignment")

a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert Date to date format
a$Date <- as.Date(a$Date, "%d/%m/%Y")

## subset from Feb. 1, 2007 to Feb. 2, 2007
a<-subset(a,Date >="2007-2-1" & Date<= "2007-2-2")
View(a)

#hist contains Global Active Power for x axis
hist(a$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#create pngfiles
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()