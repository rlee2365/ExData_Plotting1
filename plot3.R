if (!exists('pwr')) {
  pwr = read.table('household_power_consumption.txt',sep=';',header=TRUE)
}
pwr = subset(pwr, as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-01') |
  as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-02'))
pwrtime = strptime(paste(pwr$Date, pwr$Time), format='%d/%m/%Y %H:%M:%S')

png(filename='plot3.png')
plot(pwrtime, pwr$Sub_metering_1, type='l',
    xlab='', ylab='Energy sub metering', xaxt='n')
lines(pwrtime, pwr$Sub_metering_2, col='red')
lines(pwrtime, pwr$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    col=c('black','red','blue'), lty=1)
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
    seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))
dev.off()