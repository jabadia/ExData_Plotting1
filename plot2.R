# plot 2

cols <- read.csv('../household_power_consumption.txt',sep=';',nrows=1);
d <- read.csv('../household_power_consumption.txt',sep=';',nrows=24*60*2,skip=66636,header=T); 
names(d) <- names(cols); 
d$DateTime <- strptime(paste(d$Date,d$Time),format="%d/%m/%Y %H:%M:%S")

png(filename='plot2.png', width=480, height=480)
plot(d$DateTime,d$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()
