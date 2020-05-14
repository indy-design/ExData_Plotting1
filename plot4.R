library(data.table)

d <- fread("household_power_consumption.txt",header =TRUE,sep = ";",stringsAsFactors = FALSE,
           na.strings = "?",dec =".")
d1 <- d[d$Date %in% "1/2/2007"|d$Date %in% "2/2/2007"]
d1$Sub_metering_1 <- as.numeric(d1$Sub_metering_1)
d1$Sub_metering_2 <- as.numeric(d1$Sub_metering_2)
d1$Sub_metering_3 <- as.numeric(d1$Sub_metering_3)
d1$Global_reactive_power <- as.numeric(d1$Global_reactive_power)
d1$Voltage <- as.numeric(d1$Voltage)
d1$DT <- as.POSIXct(paste(d1$Date,d1$Time),format ="%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))

plot(d1$DT,d1$Global_active_power,type ="l",xlab="",ylab="Global Active Power(kilowatts)")

plot(d1$DT,d1$Voltage,type ="l",xlab ="datetime",ylab = "Voltage")

plot(d1$DT,d1$Sub_metering_1,type ="l",col ="black",xlab="",ylab="Energy sub metering")
lines(d1$DT,d1$Sub_metering_2,col ="red")
lines(d1$DT,d1$Sub_metering_3,col ="blue")
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,lty = 1)

plot(d1$DT,d1$Global_reactive_power,type ="l",xlab ="datetime",ylab="Global_reactive_power" )

dev.off()