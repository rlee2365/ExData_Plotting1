if (!exists('pwr')) {
  pwr = read.table('household_power_consumption.txt',sep=';',header=TRUE)
}
pwr = subset(pwr, as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-01') |
  as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-02'))
pwrtime = strptime(paste(pwr$Date, pwr$Time), format='%d/%m/%Y %H:%M:%S')

png(filename='plot4.png')
par(mfrow=c(2,2)) # Row first ordering

# Top left - global active power
plot(pwrtime, pwr$Global_active_power, type='l', xlab='',
     ylab='Global Active Power', xaxt='n')
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
       seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))

# Top right - voltage
plot(pwrtime, pwr$Voltage, type='l', xlab='datetime',
     ylab='Voltage', xaxt='n')
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
       seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))

# Bottom left - energy sub metering
plot(pwrtime, pwr$Sub_metering_1, type='l',
    xlab='', ylab='Energy sub metering', xaxt='n')
lines(pwrtime, pwr$Sub_metering_2, col='red')
lines(pwrtime, pwr$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    col=c('black','red','blue'), lty=1)
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
    seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))

# Bottom right - global reactive power
plot(pwrtime, pwr$Global_reactive_power, type='l', xlab='datetime',
     ylab='Global_reactive_power', xaxt='n')
points(pwrtime, pwr$Global_reactive_power, pch=20)
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
       seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))

dev.off()