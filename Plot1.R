setwd("C:/Users/Maria Jose Figueroa/Desktop")
power_consumption<-read.table("./ExData_Plotting1/household_power_consumption.txt", skip=1,sep=";")

names(power_consumption)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset_data<-subset(power_consumption,power_consumption$Date=="1/2/2007"|power_consumption$Date=="2/2/2007")
png(filename = "./ExData_Plotting1/Plot1.png",width=480, height=480)
hist(as.numeric(subset_data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()