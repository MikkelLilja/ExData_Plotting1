# Set the directory to where your data is
directory <- "C:/Users/Mikkel.A.Lilja/Desktop/Coursera/ExData/ExData_Plotting1"
setwd(directory)

# Making days in english. This works on Windows 7. Just comment it out if it doesn't work for you.
Sys.setlocale("LC_TIME", "English") 

# reading the data. Note: I have renamed the datafile to "data.txt", you will have to do the same to reproduce my plot
md <- read.table("data.txt", sep = ";", header = T, na.strings = "?")

# subsetting
md <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
md$datetime <- strptime(paste(md$Date, md$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# loading package for plotting 2 by 2
attach(mtcars)

# opening png
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# plot1
plot(md$datetime, as.numeric(md$Global_active_power), col = "black", type="l", ylab = "Global Active Power", xlab = "")

# plot2
plot(md$datetime, md$Voltage, type = "l", 
     col = "black", ylab = "global_reactive_power", xlab = "datetime")

# plot3
plot(md$datetime, md$Sub_metering_1, col = "black", type="l", xlab = "", ylab = "Energy sub metering")
lines(md$datetime, md$Sub_metering_2, col = "red", type="l")
lines(md$datetime, md$Sub_metering_3, col = "blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=1, lwd=2.5, col=c("black", "red", "blue"))

# plot4
plot(md$datetime, as.numeric(md$Global_reactive_power), type = "l", 
     col = "black", ylab = "global_reactive_power", xlab = "datetime")

dev.off()
