# Plot2.R
# Read the data from the CSV file
household_power_consumption <- read.csv("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

# Get only the dates 2007-02-01 to 2007-02-02
# Convert the Date column to  date variable
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption      <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create a new feature containing the date and time
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time ))

# Convert the active power to a numeric and plot it
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Plot #2 - output as png
png("~/R/JohnHopkins/Exploratory Data Analysis/Project 1/Plot2.png",width=480,height=480, units="px")
par(mfrow=c(1,1))
plot(household_power_consumption$Global_active_power~household_power_consumption$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
rm(household_power_consumption)
