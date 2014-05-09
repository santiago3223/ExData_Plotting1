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
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(dateTime,scan(text=as.character(mydata$Global_active_power), dec=".")
     ,type="l"
     ,ylab="Global Active Power(kilowatts)"
     ,xlab=""
)
dev.off()