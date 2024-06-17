if (!exists('pwr')) {
  pwr = read.table('household_power_consumption.txt',sep=';',header=TRUE)
}
pwr = subset(pwr, as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-01') |
  as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-02'))
pwrtime = strptime(paste(pwr$Date, pwr$Time), format='%d/%m/%Y %H:%M:%S')
png(filename='plot2.png')
plot(pwrtime, pwr$Global_active_power, type='l',
    xlab='', ylab='Global Active Power (kilowatts)', xaxt='n')
axis(1, at=strptime('2007-02-01', format='%Y-%m-%d')+
    seq(from=0, by=86400, length.out=3), labels=c('Thu','Fri','Sat'))
dev.off()