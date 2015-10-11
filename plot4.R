work <- read.csv("household_power_consumption.txt", sep=";")

work$Date <- as.Date(work$Date, "%d/%m/%Y")

work <- subset( work, work$Date >= as.Date("01-02-2007","%d-%m-%Y") & work$Date <= as.Date("02-02-2007","%d-%m-%Y"))

work$Global_active_power <- as.numeric(as.character(work$Global_active_power))
work$Global_reactive_power <- as.numeric(as.character(work$Global_reactive_power))
work$Voltage <- as.numeric(as.character(work$Voltage))
work$Sub_metering_1 <- as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 <- as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 <- as.numeric(as.character(work$Sub_metering_3))

png("plot4.png",  width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

plot(   work$diahora
        , work$Global_active_power
        , ylab = "Global Active Power"
        , xlab = ""
        , ylim = c(0,7.5)
        , type = "l")

plot(   work$diahora
        , work$Voltage
        , ylab = "Voltage"
        , xlab = "datetime"
        , type = "l")


plot(   work$diahora
        , work$Sub_metering_1
        , ylab = "Energy sub metering"
        , xlab = ""
        , ylim = c(0,38)
        , type = "l")

points(   work$diahora
          , work$Sub_metering_2
          , type = "l"
          , col = "red")

points(   work$diahora
          , work$Sub_metering_3
          , type = "l"
          , col = "blue")

legend(  "topright"
         , c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , lty=1
         , col=c("black", "red", "blue")
         , box.lwd = 0)

plot(   work$diahora
        , work$Global_reactive_power
        , ylab = "Global_reactive_power"
        , xlab = "datetime"
        , ylim = c(0, 0.5)
        , type = "l")


dev.off()

