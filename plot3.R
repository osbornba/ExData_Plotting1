data<-read.table("household_power_consumption.txt", sep=";", 
      as.is=TRUE, header=TRUE)
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
good<-data[,"Date"] == "2007-2-1"
good1<-data[,"Date"] == "2007-2-2"
good2 = good | good1
dat<- data[good2,]
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])
dtg<-paste(dat[,"Date"], dat[,"Time"])
#dtg<-strptime(dtg, "%Y-%m-%d %H:%M:%S")
dat[,"dtg"]<-dtg
png(file="plot3.png", width=480, height=480)
plot(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_1"], typ="n",
     xlab=" ", ylab="Energy sub metering")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_1"], col="black")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_2"], col="red")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
     legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()