
work <- read.csv("household_power_consumption.txt", sep=";")

work$Date <- as.Date(work$Date, "%d/%m/%Y")

work <- subset( data.frame(work$Date, work$Global_active_power), work$Date >= as.Date("01-02-2007","%d-%m-%Y") & work$Date <= as.Date("02-02-2007","%d-%m-%Y"))

work$Global_active_power <- as.numeric(as.character(work$Global_active_power))

png("plot1.png",  width = 480, height = 480, units = "px")

hist( work$Global_active_power
      , main = "Global Active Power"
      , xlim = c(0, 7.5)
      , ylim = c(0, 1200)
      , xlab = "Global Active Power (kilowatts)"
      , col = "red")

dev.off()

