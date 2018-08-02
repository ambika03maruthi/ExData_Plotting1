a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert Date to date format
a$Date <- as.Date(a$Date, "%d/%m/%Y")

## subset from Feb. 1, 2007 to Feb. 2, 2007
a <- subset(a,Date >="2007-2-1" & Date<= "2007-2-2")
View(a)

#combining date and time columns
dateTime<-paste(a$Date,a$Time)

#adding this column to a using cbind
b<-cbind(dateTime, a)

#converting dateTime to POSIXct
b$dateTime<-as.POSIXct(dateTime)
View(b)

plot(b$Global_active_power ~ b$dateTime, ylab ="Global Active Power (kilowatts)", xlab = "", type = "l")

#create pngfiles
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()