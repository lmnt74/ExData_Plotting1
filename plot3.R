#set working directory
wd <- "/users/amitmshah/code/dstoolbox/EDA"
setwd(wd)

#download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./data")

#unzip
unzip("./data")

# read household_power_consumption.txt
pwr <- read.table("household_power_consumption.txt",header=TRUE, na.strings = "?", sep = ";"
                  , colClasses = c("character","character","numeric","numeric","numeric","numeric"
                                   , "numeric", "numeric","numeric"))

#only the dates we need
temp <- pwr[pwr$Date=="1/2/2007" | pwr$Date=="2/2/2007" ,]

#formatting of dates
temp[,1] <- as.Date(strptime(temp$Date,"%d/%m/%Y"),format="%m/%d/%Y")
temp[,2] <- as.POSIXct(paste(temp$Date,temp$Time, sep = " "))

#make dataset to work with
pwr <- temp

#make plot
plot(y=pwr$Sub_metering_1, x=pwr$Time, type="l", col="black", ylab = "Energy Sub Metering", xlab="")
lines(y=pwr$Sub_metering_2, x=pwr$Time, type="l", col="red")
lines(y=pwr$Sub_metering_3, x=pwr$Time, type="l", col="blue")
legend("topright", paste("Sub_metering_",1:3,sep=""), col = 1:3, lty = 1)

