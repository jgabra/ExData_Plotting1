# Code to create plot 2

# Read data specifically for dates 2007-02-01 and 2007-02-02 and pull header from first line
data = read.table("household_power_consumption.txt", sep=";",skip=66637,nrow=2880,na.strings="?",col.names = read.table("household_power_consumption.txt", sep=";",nrow=1))

# Combine Date and Time into single variable
data$Date_Time<-paste(data$Date,data$Time)

# Convert character to date/time class
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
#Plot data with appropriate color, title, and labels
plot(data$Date_Time,data$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")

lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

# Verified plot looks correct in viewer and copy to png file
dev.copy(png,'plot3.png')
dev.off()