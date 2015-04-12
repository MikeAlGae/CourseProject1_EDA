setwd("~/Desktop")
install.packages("lubridate")
data1 <- read.table("power.txt", sep = ";", header=TRUE, na.strings = "?")

##Filter Date
timedata <- data1[ (data1$Date == "1/2/2007"| data1$Date == "2/2/2007"),]

##combine date and time columns
timedata$ds <- paste(timedata$Date, timedata$Time)
timedata$dt <- dmy_hms(timedata$ds)


#create plot
with(timedata, plot(dt, Sub_metering_2, type="n", xlab = "", ylim = c(0, 40), ylab = "Energy sub metering"))
with(timedata, lines(dt, Sub_metering_1, col = "black"))
with(timedata, lines(dt, Sub_metering_2, col = "red"))
with(timedata, lines(dt, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "blue", "red"), lty = "solid", legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

#print png
png(file = "plot3.png", width=480,height=480,bg = "transparent")