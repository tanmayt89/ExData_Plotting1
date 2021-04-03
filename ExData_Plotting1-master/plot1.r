plaininfo <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plaininfo$Date <- as.Date(plaininfo$Date, format="%d/%m/%Y")

plaininfo_subset_dates <- subset(plaininfo , subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plaininfo)

plaininfo_conv_subset_dates <- paste(as.Date(plaininfo_subset_dates$Date), plaininfo_subset_dates$Time)
plaininfo_subset_dates$Datetime <- as.POSIXct(plaininfo_conv_subset_dates)

hist(plaininfo_subset_dates$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()