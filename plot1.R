plot1<-function(){
        ##Rscript to create the first plot of four.
        data<-read.csv('household_power_consumption.txt', sep=';',na.strings='?')
        data$Date<-as.Date(strptime(data$Date, '%d/%m/%Y'))
        data2<-subset (data, Date >= '2007-02-01' & Date<='2007-02-02')
        png(filename = 'Plot1.png', width=480, height=480, units='px')
        hist(data2$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
        dev.off()
}