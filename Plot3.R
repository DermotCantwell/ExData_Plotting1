# Plot3.R
# Read the data from the CSV file
household_power_consumption <- read.csv("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Get only the dates 2007-02-01 to 2007-02-02
# Convert the Date column to  date variable
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption      <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create a new feature containing the date and time
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time ))

# Convert the sub_metering cols to a numeric and plot it
household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)


#Plot #3 - output as png
png("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/Plot3.png",width=480,height=480, units="px")
par(mfrow=c(1,1))
plot(household_power_consumption$Sub_metering_1~household_power_consumption$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines(household_power_consumption$Sub_metering_2~household_power_consumption$DateTime,col='Red')
lines(household_power_consumption$Sub_metering_3~household_power_consumption$DateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
rm(household_power_consumption)
