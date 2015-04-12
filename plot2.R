setwd("~/Desktop")
install.packages("lubridate")
data1 <- read.table("power.txt", sep = ";", header=TRUE, na.strings = "?")

##Filter Date
timedata <- data1[ (data1$Date == "1/2/2007"| data1$Date == "2/2/2007"),]

##combine date and time columns
timedata$ds <- paste(timedata$Date, timedata$Time)
timedata$dt <- dmy_hms(timedata$ds)

##make GAP column numeric
time <- as.character(timedata$Global_active_power)
time <- as.numeric(timedata$Global_active_power)
timedata$Global_active_power <- time


with(timedata, plot(dt, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
png(file = "plot2.png", width=480,height=480,bg = "transparent")
