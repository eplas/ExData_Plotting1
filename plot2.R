
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

# 2nd plot
png("plot2.png",width=480,height=480,units="px")
plot(as.POSIXct(paste(pw$Date, pw$Time),format="%d/%m/%Y %H:%M:%S"),pw$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
