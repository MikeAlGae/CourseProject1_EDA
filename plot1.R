setwd("~/Desktop")
install.packages("lubridate")
data1 <- read.table("power.txt", sep = ";", header=TRUE, na.strings = "?")

##Filter Date
timedata <- data1[ (data1$Date == "1/2/2007"| data1$Date == "2/2/2007"),]

## Format data
GAP <- as.character(timedata$Global_active_power)
GAP <- as.numeric(timedata$Global_active_power)

## Plot data
hist(GAP, col = "red", xlab = "Global Active Power(kilowatts)", xlim= c(0,6), ylim = c(0, 1200), ylab="Frequency", main="Global Active Power", breaks = 12)
png(file = "plot1.png", width=480,height=480,bg = "transparent")