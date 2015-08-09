#read txt file and get the data from dates 2007-02-01 and 2007-02-02
filename<-"./data/household_power_consumption.txt"
data<-read.table(filename,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert the Date and Time variables to Date/Time classes in R
datetime<-strptime(paste(subdata$Date,subdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#convert char into numeric
globalactivepower<-as.numeric(subdata$Global_active_power)
submetering1<-as.numeric(subdata$Sub_metering_1)
submetering2<-as.numeric(subdata$Sub_metering_2)
submetering3<-as.numeric(subdata$Sub_metering_3)

png("plot3.png",width = 480,height = 480)
plot(datetime,submetering1,type = "l",ylab = "Energy Submetering")
lines(datetime,submetering2,type = "l",col="red")
lines(datetime,submetering3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))
dev.off()
