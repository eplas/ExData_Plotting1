
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

# 1st plot
png("plot1.png",width=480,height=480,units="px")
hist(pw$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
