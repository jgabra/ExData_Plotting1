# Code to create plot 1

# Read data specifically for dates 2007-02-01 and 2007-02-02 and pull header from first line
data = read.table("household_power_consumption.txt", sep=";",skip=66637,nrow=2880,na.strings="?",col.names = read.table("household_power_consumption.txt", sep=";",nrow=1))

# Combine Date and Time into single variable
data$Date_Time<-paste(data$Date,data$Time)

# Convert character to date/time class
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S")

#Plot data with appropriate color, title, and labels
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Verified plot looks correct in viewer and copy to png file
dev.copy(png,'plot1.png')
dev.off()