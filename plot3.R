# plot 3

# ensure day and month names are written in English
Sys.setlocale(locale='C')

# read data
nrows <- 24*60*2 # 2 days in minutes
skiprows <- 66636 # row where 1/2/2007 00:00:00 appears
cols <- read.csv('../household_power_consumption.txt',sep=';',nrows=1); # to get col names
d <- read.csv('../household_power_consumption.txt',sep=';',nrows=nrows,skip=skiprows,header=T); # read data of first 2 days of Feb 2007
names(d) <- names(cols); 
d$DateTime <- strptime(paste(d$Date,d$Time),format="%d/%m/%Y %H:%M:%S") # parse date-times

# generate plot
png(filename='plot3.png', width=480, height=480)

plot(d$DateTime,d$Sub_metering_1,col="black", type='l',xlab='',ylab='Energy sub metering')
lines(d$DateTime,d$Sub_metering_2,col="red")
lines(d$DateTime,d$Sub_metering_3,col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'))

dev.off()
