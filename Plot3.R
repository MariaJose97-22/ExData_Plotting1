setwd("C:/Users/Maria Jose Figueroa/Desktop")
power_consumption<-read.table("./ExData_Plotting1/household_power_consumption.txt", skip=1,sep=";")

names(power_consumption)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset_data<-subset(power_consumption,power_consumption$Date=="1/2/2007"|power_consumption$Date=="2/2/2007")


subset_data$Date<-as.Date(subset_data$Date,format = "%d%m%Y")
subset_data$Time<-strptime(subset_data$Time,format = "%H:%M:%S")
subset_data[1:1440,"Time"] <- format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"] <- format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png(filename = "./ExData_Plotting1/Plot3.png")
plot(subset_data$Time,subset_data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$Time,subset_data$Sub_metering_2,col="red")
lines(subset_data$Time,subset_data$Sub_metering_3,col="blue")
legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()