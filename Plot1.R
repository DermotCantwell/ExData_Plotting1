# Plot1.R
# Read the data from the CSV file
household_power_consumption <- read.csv("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Get only the dates 2007-02-01 to 2007-02-02
# Convert the Date column to  date variable
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption      <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert the active power to a numeric and plot it
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Plot #1 - output as png
png("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/Plot1.png",width=480,height=480, units="px")
par(mfrow=c(1,1))
hist(household_power_consumption$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save as png
dev.off()
rm(household_power_consumption)
