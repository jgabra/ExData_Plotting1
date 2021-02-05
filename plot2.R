# Code to create plot 2

# Read data specifically for dates 2007-02-01 and 2007-02-02 and pull header from first line
data = read.table("household_power_consumption.txt", sep=";",skip=66637,nrow=2880,na.strings="?",col.names = read.table("household_power_consumption.txt", sep=";",nrow=1))

# Combine Date and Time into single variable
data$Date_Time<-paste(data$Date,data$Time)

# Convert character to date/time class
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")

#Plot data with appropriate color, title, and labels
plot(data$Date_Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",)

# Verified plot looks correct in viewer and copy to png file
dev.copy(png,'plot2.png')
dev.off()