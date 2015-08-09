#read txt file and get the data from dates 2007-02-01 and 2007-02-02
filename<-"./data/household_power_consumption.txt"
data<-read.table(filename,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert the Date and Time variables to Date/Time classes in R
datetime<-strptime(paste(subdata$Date,subdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#convert char into numeric
globalactivepower<-as.numeric(subdata$Global_active_power)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
submetering1<-as.numeric(subdata$Sub_metering_1)
submetering2<-as.numeric(subdata$Sub_metering_2)
submetering3<-as.numeric(subdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power", cex=0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, submetering1, type="l", ylab = "Energy Submetering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()