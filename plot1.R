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

#check NAs
sum(is.na(pwr$Global_active_power))

#make plot1
hist(pwr$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")
