a<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#convert Date to date format
a$Date <- as.Date(a$Date, "%d/%m/%Y")

## subset from Feb. 1, 2007 to Feb. 2, 2007
a<-subset(a,Date >="2007-2-1" & Date<= "2007-2-2")
View(a)

#combining date and time columns
dateTime<-paste(a$Date,a$Time)

#adding this column to a using cbind
b<-cbind(dateTime, a)

#converting dateTime to POSIXct
b$dateTime<-as.POSIXct(dateTime)
View(b)

par(mfrow=c(2,2), mar=c(4,4,2,2))

#plot1
plot(b$Global_active_power ~ b$dateTime, ylab ="Global Active Power", xlab = "", type = "l")

#plot2
with(b,plot(Voltage~dateTime, type="l"))

#plot3
with(b, plot(Sub_metering_1~dateTime, ylab = "Energy Sub metering", xlab = "", type = "l"))
points(b$dateTime,b$Sub_metering_2, type = "l", col="red")
points(b$dateTime,b$Sub_metering_3, type = "l", col="blue")
legend("topright",pch = "----", col = c("black", "red", "blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

#plot4
with(b,plot(Global_reactive_power~dateTime, type="l"))

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()