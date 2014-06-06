data<-read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
good<-data[,"Date"] == "2007-2-1"
good1<-data[,"Date"] == "2007-2-2"
good2 = good | good1
dat<- data[good2,]
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])
dtg<-paste(dat[,"Date"], dat[,"Time"])
dat[,"dtg"]<-dtg
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(as.POSIXlt(dat[,"dtg"]), dat[,"Global_active_power"], typ="n",
     xlab=" ", ylab="Global Active Power")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Global_active_power"])

plot(as.POSIXlt(dat[,"dtg"]), dat[,"Voltage"], typ="n",
     xlab="datetime", ylab="Voltage")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Voltage"])

plot(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_1"], typ="n",
     xlab=" ", ylab="Energy sub metering")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_1"], col="black")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_2"], col="red")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(as.POSIXlt(dat[,"dtg"]), dat[,"Global_reactive_power"], typ="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Global_reactive_power"])

dev.off()