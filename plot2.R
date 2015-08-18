# Set the directory to where your data is
directory <- "C:/Users/Mikkel.A.Lilja/Desktop/Coursera/ExData/ExData_Plotting1"
setwd(directory)

# reading the data. Note: I have renamed the datafile to "data.txt", you will have to do the same to reproduce my plot
data <- read.table("data.txt", sep = ";", header = T)

# subsetting and creating datetime column
md <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
md$datetime <- strptime(paste(md$Date, md$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 


# plotting and saving to a .png file
png("plot2.png", width = 480, height = 480)
plot(md$datetime, as.numeric(md$Global_active_power), col = "black", type="l", ylab = "Global Active Power (kilowatts)")
dev.off()

