data<-read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
good<-data[,"Date"] == "2007-2-1"
good1<-data[,"Date"] == "2007-2-2"
good2 = good | good1
dat<- data[good2,]
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])
dtg<-paste(dat[,"Date"], dat[,"Time"])
#dtg<-strptime(dtg, "%Y-%m-%d %H:%M:%S")
dat[,"dtg"]<-dtg
png(file="plot2.png", width=480, height=480)
plot(as.POSIXlt(dat[,"dtg"]), dat[,"Global_active_power"], typ="n",
     xlab=" ", ylab="Global Active Power (kilowatts)")
lines(as.POSIXlt(dat[,"dtg"]), dat[,"Global_active_power"])
dev.off()