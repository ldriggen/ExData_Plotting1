# Course: Coursera - Explorator Data Analysis
# Instructor: Dr. Roger Peng
# Project 1
# Purpose: Reproduce plot 2

# Read the dataset and perform manipulation to make the variables to be plotted numeric

hpc <- read.table("./household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<-as.numeric(hpc$Global_active_power) 
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
hpcsubset <- subset(hpc,as.Date(hpc$DateTime)=="2007-02-01" | as.Date(hpc$DateTime)=="2007-02-02")

# plot 2
png(file = "plot2.png", width = 480, height = 480, units = "px" ) 
plot(hpcsubset$DateTime,hpcsubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off() 
