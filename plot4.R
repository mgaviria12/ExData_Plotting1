db <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
db$DateTime <- paste(db$Date, db$Time)
db$Date <- dmy(db$Date)
db$Time <- hms(db$Time)
db$DateTime <- dmy_hms(db$DateTime)
db <- db[db$Date == "2007-02-01" | db$Date == "2007-02-02" ,]

par(mfrow = c(2,2), mar = c(4,4,2,1))

with(db, plot(DateTime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power"))
lines(db$DateTime, db$Global_active_power)

with(db, plot(DateTime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
lines(db$DateTime, db$Voltage)

with(db, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub meetering"))
lines(db$DateTime, db$Sub_metering_1, col = "black")
lines(db$DateTime, db$Sub_metering_2, col = "red")
lines(db$DateTime, db$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7,  box.lty=0)

with(db, plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power"))
lines(db$DateTime, db$Global_reactive_power)

dev.copy(png, file = "plot4.png")
dev.off()
