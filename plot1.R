tab<-read.table("household_power_consumption.txt", header = TRUE, sep=";",col.names = c("date","time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),stringsAsFactors = FALSE)
tab <- tab[tab$date %in% c("1/2/2007","2/2/2007"),]
tab<- mutate(tab, x = paste(date,time))
tab<- mutate(tab, dt= strptime(x,"%d/%m/%Y %H:%M:%S"))
b<-c("Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3","dt")
tab<- tab[b]
class(tab$Global_active_power)="numeric"
png("plot1.png")
hist(tab$Global_active_power, xlab = "Global Active Power (killowatts)", main= "GLOBAL ACTIVE POWER", col="red")
dev.off()