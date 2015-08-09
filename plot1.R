#read txt file and get the data from dates 2007-02-01 and 2007-02-02
filename<-"./data/household_power_consumption.txt"
data<-read.table(filename,header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#convert global active power(char) into numeric
globalactivepower<-as.numeric(subdata$Global_active_power)

#draw the graph
png("plot1.png",width = 480, height = 480)
hist(globalactivepower,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

