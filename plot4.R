## clear any existing graph
plot.new()

## declare png file
png(filename = "plot4.png")

## create grid
par(mfcol = c(2,2))

## read in data and format date field
cons <- read.delim('household_power_consumption.txt', header = TRUE, sep = ';')
cons$Date <- strptime(cons$Date, format = '%d/%m/%Y')

# # subset data to specified dates
con <- subset(cons, cons$Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')))
con$dayofweek <- strftime(con$Date, "%a") # grab day of week

# top left plot
plot(x = as.numeric(con$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "", xaxt = 'n')
axis(side = 1, at = c(1,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
#plot.new()

# bottom left plot
## initial plot line
plot(x = as.numeric(con$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "", xaxt = 'n')

## subsequent overlaid lines
lines(con$Sub_metering_2, col = 'red')
lines(con$Sub_metering_3, col = 'blue')

## set custom axis labels
axis(side = 1, at = c(1,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
## sum(con$dayofweek == 'Thu') to get the cutoff point

legend("topright", lty = 1, col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#plot.new()

## top right plot
plot(x = as.numeric(con$Voltage), type = 'l', ylab = 'Voltage', xlab = 'datetime', xaxt = 'n')
axis(side = 1, at = c(1,1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
#plot.new()

## bottom right plot
plot(x = as.numeric(con$Global_reactive_power), type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime', xaxt = 'n')
axis(side = 1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))

dev.off()