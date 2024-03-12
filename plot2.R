## clear any existing graph
plot.new()

## declare png file
png(filename = "plot2.png")

## read in data
cons <- read.delim('household_power_consumption.txt', header = TRUE, sep = ';')
cons$Date <- strptime(cons$Date, format = '%d/%m/%Y')
#
# # subset data to specified dates
con <- subset(cons, cons$Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))
con$dayofweek <- strftime(con$Date, "%a") #weekdays(con$Date)

plot(x = as.numeric(con$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = 'n')
axis(side = 1, at = c(1,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
## sum(con$dayofweek == 'Thu') to get the cutoff point

dev.off()