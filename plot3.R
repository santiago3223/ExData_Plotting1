## Reading the data
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")
## Formating Date
mydata$Date = as.Date(mydata$Date, format = "%d/%m/%Y") 
## Subsetting data
rows   = mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02") 
mydata = mydata[rows, ] 
## Merge date and time
dateTime<-paste(mydata$Date,mydata$Time)
dateTime<-strptime(dateTime,"%Y-%m-%d %H:%M:%S")
##Plotting
png(file = "plot3.png", width = 480, height = 480, units = "px")
 plot(dateTime, scan(text=as.character(mydata$Sub_metering_1), dec="."), type="n", xlab="", ylab="Energy sub metering")
lines(dateTime, scan(text=as.character(mydata$Sub_metering_1), dec="."))
lines(dateTime, scan(text=as.character(mydata$Sub_metering_2), dec="."), col="red")
 lines(dateTime, scan(text=as.character(mydata$Sub_metering_3), dec="."), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
dev.off()