setwd("~/Desktop")
data1 <- read.table("power.txt", sep = ";", header=TRUE, na.strings = "?")

##Filter Date
timedata <- data1[ (data1$Date == "1/2/2007"| data1$Date == "2/2/2007"),]

##combine date and time columns
timedata$ds <- paste(timedata$Date, timedata$Time)
timedata$dt <- dmy_hms(timedata$ds)


#set 2x2 plots
par(mfrow=c(2,2))
#topleft
with(timedata, plot(dt, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#topright
with(timedata, plot(dt, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
#bottom left
with(timedata, plot(dt, Sub_metering_2, type="n", xlab = "", ylim = c(0, 40), ylab = "Energy sub metering"))
with(timedata, lines(dt, Sub_metering_1, col = "black"))
with(timedata, lines(dt, Sub_metering_2, col = "red"))
with(timedata, lines(dt, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "blue", "red"), lty = "solid", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
## bottom right
with(timedata, plot(dt, Global_reactive_power, type = "l", xlab = "datetime"))
##print to png
png(file = "plot4.png", width=480,height=480,bg = "transparent")
