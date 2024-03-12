## clear any existing graph
plot.new()

## declare png file
png(filename = "plot3.png")

## read in data and format date field
cons <- read.delim('household_power_consumption.txt', header = TRUE, sep = ';')
cons$Date <- strptime(cons$Date, format = '%d/%m/%Y')

# # subset data to specified dates
con <- subset(cons, cons$Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))
con$dayofweek <- strftime(con$Date, "%a") # grab day of week

## initial plot line
plot(x = as.numeric(con$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "", xaxt = 'n')

## subsequent overlaid lines
lines(con$Sub_metering_2, col = 'red')
lines(con$Sub_metering_3, col = 'blue')

## set custom axis labels
axis(side = 1, at = c(1,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
## sum(con$dayofweek == 'Thu') to get the cutoff point

legend("topright", lty = 1, col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()