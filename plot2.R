library(data.table)
d <- fread("household_power_consumption.txt",header =TRUE,sep = ";",stringsAsFactors = FALSE,
           na.strings = "?",dec =".")
d1 <- d[d$Date %in% "1/2/2007"|d$Date %in% "2/2/2007"]
d1$Global_active_power <- as.numeric(d1$Global_active_power)
d1$DT <- as.POSIXct(paste(d1$Date,d1$Time),format ="%d/%m/%Y %H:%M:%S")

png("plot2.png",width = 480,height = 480)
plot(d1$DT,d1$Global_active_power,type ="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()