
# pw <- read_delim("household_power_consumption.txt",  col_types="ccnnnnnnn",col_names=TRUE,na="?",delim=";")
# Viewing data we can extract these parameters for 1/2/2007 to 2/2/2007:
# nmax=2880
# skip=66637

# Read data
pw <- read_delim("household_power_consumption.txt",  col_types="ccnnnnnnn",col_names=FALSE,na="?",delim=";",skip=66637,n_max=2880)

# extract column names:
nm <- read_delim("household_power_consumption.txt",col_names=TRUE,na="?",delim=";",n_max=0)

# assign names:
names(pw) <- names(nm)

# 4th plot
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
par(mar=c(5,4,3,2))
plot(as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"),pw$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"),pw$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot (as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"), pw$Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="")
lines(as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"), pw$Sub_metering_2, type="l",col="red")
lines(as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"), pw$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot (as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M:%S"), pw$Global_reactive_power, type="l",col="black",ylab="Global_reactive_power",xlab="datetime")

dev.off()
