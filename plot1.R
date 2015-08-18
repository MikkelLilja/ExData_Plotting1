# Set the directory to where your data is
directory <- "C:/Users/Mikkel.A.Lilja/Desktop/Coursera/ExData/ExData_Plotting1"
setwd(directory)

# reading the data. Note: I have renamed the datafile to "data.txt", you will have to do the same to reproduce my plot
data <- read.table("data.txt", sep = ";", header = T)

# subsetting
md <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# plotting and saving to a .png file
png("plot1.png", width = 480, height = 480)
hist(as.numeric(md$Global_active_power), breaks = 15, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
