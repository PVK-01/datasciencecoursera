tab<-read.table("household_power_consumption.txt", header = TRUE, sep=";",col.names = c("date","time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),stringsAsFactors = FALSE)
tab <- tab[tab$date %in% c("1/2/2007","2/2/2007"),]
tab<- mutate(tab, x = paste(date,time))
tab<- mutate(tab, dt= strptime(x,"%d/%m/%Y %H:%M:%S"))
b<-c("Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3","dt")
tab<- tab[b]
png("plot3.png")
with(tab, plot(dt, Sub_metering_1,type="l", col="black",xlab="",ylab="Energy sub metering"))
with(tab, points(dt, Sub_metering_2,type="l", col="red"))
with(tab, points(dt, Sub_metering_3,type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=.5)
dev.off()