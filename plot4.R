# plot 4

# ensure day and month names are written in English
Sys.setlocale(locale='C')

cols <- read.csv('../household_power_consumption.txt',sep=';',nrows=1);
d <- read.csv('../household_power_consumption.txt',sep=';',nrows=24*60*2,skip=66636,header=T); 
names(d) <- names(cols); 
d$DateTime <- strptime(paste(d$Date,d$Time),format="%d/%m/%Y %H:%M:%S")

png(filename='plot4.png', width=480, height=480)

par(mfrow=c(2,2))

# plot row=1, col=1
plot(d$DateTime, d$Global_active_power, type='l', ylab="Global Active Power", xlab="")

# plot row=1, col=2
plot(d$DateTime, d$Voltage, type='l', ylab="Voltage", xlab="datetime")

# plot row=2, col=1
plot(d$DateTime,d$Sub_metering_1, col="black", type='l',xlab='',ylab='Energy sub metering')
lines(d$DateTime,d$Sub_metering_2, col="red")
lines(d$DateTime,d$Sub_metering_3, col="blue")
legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black','red','blue'), bty="n")

# plot row=2, col=2
plot(d$DateTime, d$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")

dev.off()
