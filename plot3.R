

work <- read.csv("household_power_consumption.txt", sep=";")

work$Date <- as.Date(work$Date, "%d/%m/%Y")

work <- subset( work, work$Date >= as.Date("01-02-2007","%d-%m-%Y") & work$Date <= as.Date("02-02-2007","%d-%m-%Y"))

work$Sub_metering_1 <- as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 <- as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 <- as.numeric(as.character(work$Sub_metering_3))

work <- data.frame(work, diahora = as.POSIXct( paste(work$Date, work$Time), "%Y-%m-%d %H:%M:%S", tz = ""))

png("plot3.png",  width = 480, height = 480, units = "px")

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
       )

dev.off()

