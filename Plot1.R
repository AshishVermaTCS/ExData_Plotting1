##READ THE DATA
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",colClasses = c(Global_active_power = "numeric", Global_reactive_power = "numeric", Voltage = "numeric", Global_intensity = "numeric", Sub_metering_1 = "numeric", Sub_metering_2 = "numeric", Sub_metering_3 = "numeric"))

##FORMAT THE DATA AS DATE AND TIME COLUMNS
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

##SUBSETTING THE DATA FROM DATE RANGE BETWEEN "2007-02-01" AND "2007-02-02"
data_subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##PLOT THE HISTOGRAM
hist(data_subset$Global_active_power, col= "red",xlab = "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")

##COPY THE PLOT TO PLOT1.PNG
dev.copy(png, 'Plot1.png')

##OFF THE PNG DEVICE
dev.off()

