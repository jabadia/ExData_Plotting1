# plot 1

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
png(filename='plot1.png', width=480, height=480)
hist(d$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
