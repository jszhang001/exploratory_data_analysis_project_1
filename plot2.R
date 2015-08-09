#read txt file and get the data from dates 2007-02-01 and 2007-02-02
filename<-"./data/household_power_consumption.txt"
data<-read.table(filename,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert the Date and Time variables to Date/Time classes in R
datetime<-strptime(paste(subdata$Date,subdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

globalactivepower<-as.numeric(subdata$Global_active_power)
png("plot2.png",width = 480,height = 480)
plot(datetime,globalactivepower,type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()