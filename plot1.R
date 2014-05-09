## Reading the data
mydata = read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".")
## Formating Date
mydata$Date = as.Date(mydata$Date, format = "%d/%m/%Y") 
## Subsetting data
rows   = mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02") 
mydata = mydata[rows, ] 
##Plotting
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(scan(text=as.character(mydata$Global_active_power), dec="."), 
      col = "red", main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)")
dev.off()