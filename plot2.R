db <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db$DateTime <- paste(db$Date, db$Time)
db$Date <- dmy(db$Date)
db$Time <- hms(db$Time)
db$DateTime <- dmy_hms(db$DateTime)
db <- db[db$Date == "2007-02-01" | db$Date == "2007-02-02" ,]

with(db, plot(DateTime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
lines(db$DateTime, db$Global_active_power)
dev.copy(png, file = "plot2.png")
dev.off()