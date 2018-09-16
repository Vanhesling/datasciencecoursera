# unzip the file
unzip("exdata_data_household_power_consumption.zip")

# caculate the colClasses, speed the file reading

tab5rows <- read.table("household_power_consumption.txt",sep = ";",header = 1,stringsAsFactors = F,nrow = 5)
classes <- sapply(tab5rows, class)

# read the file with specified rows and colClasses
T <- read.table("household_power_consumption.txt",sep = ";",header = 1,stringsAsFactors = F,colClasses = classes,na.strings = "?",nrows = 2075259,comment.char = "")

# convert the Date and Time variables to Date/Time classes

T$Date_Time <- strptime(paste(T$Date,T$Time),format ="%d/%m/%Y %H:%M:%S")

# Select the dates between 2007-02-01 and 2007-02-02

T2 <- subset(T, T$Date_Time > "2007-02-01" & T$Date_Time < "2007-02-03")

# First plot
par(mfrow=c(1,1))
hist(T2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Save to file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
