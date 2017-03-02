##READ THE DATA
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",colClasses = c(Global_active_power = "numeric", Global_reactive_power = "numeric", Voltage = "numeric", Global_intensity = "numeric", Sub_metering_1 = "numeric", Sub_metering_2 = "numeric", Sub_metering_3 = "numeric"))

##FORMAT THE DATA AS DATE AND TIME COLUMNS
data$DateWithTime <- dmy_hms(paste(data$Date,data$Time),tz= "Asia/Kolkata")

##SUBSETTING THE DATA FROM DATE RANGE BETWEEN "2007-02-01" AND "2007-02-02"
data_subset <- subset(data, data$DateWithTime >= "2007-02-01 00:00:00" & data$DateWithTime <= "2007-02-03 00:01:00")

##SET THE NUMBER OF PLOTS
par(mfrow=c(2,2))

##PLOT THE FIRST ONE (1,1)
plot(data_subset$DateWithTime,data_subset$Global_active_power, type= "n", xlab="", ylab= "Global Active Power (kilowatts)")
lines(data_subset$DateWithTime,data_subset$Global_active_power,type= "l")

##PLOT THE SECOND ONE (1,2)
plot(data_subset$DateWithTime,data_subset$Voltage, type= "n", xlab = "datetime", ylab= "Voltage")
lines(data_subset$DateWithTime,data_subset$Voltage,type= "l")

##PLOT THE THIRD ONE (2,1)
plot(data_subset$DateWithTime,data_subset$Sub_metering_1, type= "n", xlab="", ylab= "Energy sub metering")

lines(data_subset$DateWithTime,data_subset$Sub_metering_1,type= "l")
lines(data_subset$DateWithTime,data_subset$Sub_metering_2,type= "l",col= "red")
lines(data_subset$DateWithTime,data_subset$Sub_metering_3,type= "l",col= "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"),lwd=2,lty=NULL,bty="n",cex=0.75)

##PLOT THE FOURTH ONE (2,2)
plot(data_subset$DateWithTime,data_subset$Global_reactive_power, type= "n", xlab = "datetime", ylab= "Global_reactive_power")
lines(data_subset$DateWithTime,data_subset$Global_reactive_power,type= "l")

##COPY THE PLOT TO PLOT4.PNG
dev.copy(png, 'Plot4.png')

##OFF THE PNG DEVICE
dev.off()

