# Course: Coursera - Explorator Data Analysis
# Instructor: Dr. Roger Peng
# Project 1 
# Purpose: Reproduce plot 3 

# Read the dataset and perform manipulation to make the variables to be plotted numeric

hpc <- read.table("./household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Global_active_power<-as.numeric(hpc$Global_active_power) 
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
hpcsubset <- subset(hpc,as.Date(hpc$DateTime)=="2007-02-01" | as.Date(hpc$DateTime)=="2007-02-02")

# Reproduce plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px") 
with(hpcsubset, plot(DateTime,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(hpcsubset, lines(DateTime,Sub_metering_2,col="red"))
with(hpcsubset, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", lty=1,  col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
