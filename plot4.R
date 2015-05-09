plot4<-function(){
        ##Rscript to create the fourth plot of four.
        data<-read.csv('household_power_consumption.txt', sep=';',na.strings='?')
        data$Date<-as.Date(strptime(data$Date, '%d/%m/%Y'))
        data2<-subset (data, Date >= '2007-02-01' & Date<='2007-02-02')
        data2$datetime<-as.POSIXct(paste(data2$Date, data2$Time), format='%Y-%m-%d %H:%M:%S')
                
        png(filename = 'Plot4.png', width=480, height=480, units='px')
        par(mfrow =c(2,2))
        ##plot1
        plot(data2$datetime, data2$Global_active_power, type = "l", ylab = "Global Active Power", xlab=" ")
        ##plot2
        plot(data2$datetime, data2$Voltage, type = 'l', ylab = 'Voltage', xlab='datetime')
        ##plot3
        plot(data2$datetime, data2$Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
        lines(data2$datetime, data2$Sub_metering_1)
        lines(data2$datetime, data2$Sub_metering_2, col="red")
        lines(data2$datetime, data2$Sub_metering_3, col="blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1,bty = "n", col = c("black","red","blue"))
        ##plot4
        plot(data2$datetime, data2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab=" ")
        dev.off() 
}