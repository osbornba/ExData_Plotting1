data<-read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
data[,"Date"]<-as.Date(data[,"Date"], "%d/%m/%Y")
good<-data[,"Date"] == "2007-2-1"
good1<-data[,"Date"] == "2007-2-2"
good2 = good | good1
dat<- data[good2,]
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])
png(file="plot1.png", width=480, height=480)
hist(dat$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
dev.off()
