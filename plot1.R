## Read all data
allData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#" Subsets
data <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(allData)

## Date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kw)", ylab="Frequency", col="Red")

## Save PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()