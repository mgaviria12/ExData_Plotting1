library(lubridate)
library(dplyr)

db <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db$DateTime <- paste(db$Date, db$Time)
db$Date <- dmy(db$Date)
db$Time <- hms(db$Time)
db$DateTime <- dmy_hms(db$DateTime)
db <- db[db$Date == "2007-02-01" | db$Date == "2007-02-02" ,]

hist(db$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()