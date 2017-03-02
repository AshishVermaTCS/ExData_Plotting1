##READ THE DATA
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",colClasses = c(Global_active_power = "numeric", Global_reactive_power = "numeric", Voltage = "numeric", Global_intensity = "numeric", Sub_metering_1 = "numeric", Sub_metering_2 = "numeric", Sub_metering_3 = "numeric"))

##FORMAT THE DATA AS DATE AND TIME COLUMNS
data$DateWithTime <- dmy_hms(paste(data$Date,data$Time),tz= "Asia/Kolkata")

##SUBSETTING THE DATA FROM DATE RANGE BETWEEN "2007-02-01" AND "2007-02-02"
data_subset <- subset(data, data$DateWithTime >= "2007-02-01 00:00:00" & data$DateWithTime <= "2007-02-03 00:01:00")

##CREATE A BLANK PLOT 
plot(data_subset$DateWithTime,data_subset$Sub_metering_1, type= "n", xlab="", ylab= "Energy sub metering")

##ADD LINES
lines(data_subset$DateWithTime,data_subset$Sub_metering_1,type= "l")
lines(data_subset$DateWithTime,data_subset$Sub_metering_2,type= "l",col= "red")
lines(data_subset$DateWithTime,data_subset$Sub_metering_3,type= "l",col= "blue")

##ADD LEGEND
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"),lwd=2,lty=NULL)

##COPY THE PLOT TO PLOT3.PNG
dev.copy(png, 'Plot3.png')

##OFF THE PNG DEVICE
dev.off()

