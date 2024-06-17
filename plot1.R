pwr = read.table('household_power_consumption.txt',sep=';',header=TRUE)
pwr = subset(pwr, as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-01') |
               as.Date(Date, '%d/%m/%Y') == as.Date('2007-02-02'))
png(filename='plot1.png')
hist(as.numeric(pwr$Global_active_power), col='red', main='Global Active Power', 
     xlab='Global Active Power (kilowatts)',
     ylab='Frequency')
dev.off()