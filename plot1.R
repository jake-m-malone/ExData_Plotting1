## clear any existing graph
plot.new()

## declare png file
png(filename = "plot1.png")

## read in data
cons <- read.delim('household_power_consumption.txt', header = TRUE, sep = ';')
cons$Date <- strptime(cons$Date, format = '%d/%m/%Y')

# subset data to specified dates
con <- subset(cons, cons$Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))

hist(as.numeric(con$Global_active_power),xlab = 'Global Active Power (kilowatts)',ylab = 'Frequency',main = 'Global Active Power',col = 'red')

dev.off()