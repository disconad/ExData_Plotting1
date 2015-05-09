plot2<-function(){
        ##Rscript to create the second plot of four.
        data<-read.csv('household_power_consumption.txt', sep=';',na.strings='?')
        data$Date<-as.Date(strptime(data$Date, '%d/%m/%Y'))
        data2<-subset (data, Date >= '2007-02-01' & Date<='2007-02-02')
        data2$datetime<-as.POSIXct(paste(data2$Date, data2$Time), format='%Y-%m-%d %H:%M:%S')
        png(filename = 'Plot2.png', width=480, height=480, units='px')
        plot(data2$datetime, data2$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab='')
        dev.off() 
        
}