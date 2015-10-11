

work <- read.csv("household_power_consumption.txt", sep=";")

work$Date <- as.Date(work$Date, "%d/%m/%Y")

work <- subset( work, work$Date >= as.Date("01-02-2007","%d-%m-%Y") & work$Date <= as.Date("02-02-2007","%d-%m-%Y"))

work$Global_active_power <- as.numeric(as.character(work$Global_active_power))

work <- data.frame(work, diahora = as.POSIXct( paste(work$Date, work$Time), "%Y-%m-%d %H:%M:%S", tz = ""))

png("plot2.png",  width = 480, height = 480, units = "px")

plot(   work$diahora
      , work$Global_active_power
      , ylab = "Global Active Power (kilowatts)"
      , xlab = ""
      , type = "l")

dev.off()

