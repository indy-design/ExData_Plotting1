# load libraries
library(data.table)
d <- fread("household_power_consumption.txt",header =TRUE,sep = ";",stringsAsFactors = FALSE,
           na.strings = "?")
d1 <- d[d$Date %in% "1/2/2007"|d$Date %in% "2/2/2007"]
d2 <- na.omit(as.numeric(d1$Global_active_power))
png("plot1.png",width = 480,height = 480)
hist(d2,xlim = c(0,6) , ylim = c(0,1200),col ="red",
     main = "Global Active Power",xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

dev.off()