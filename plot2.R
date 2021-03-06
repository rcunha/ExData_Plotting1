## download and prepare data
dir.create("data", showWarnings=FALSE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/file.zip", method="curl")
unzip("data/file.zip",exdir="data/")
df <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]
df$datetime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")

## plot
png(filename="plot2.png", width=480,height=480,units="px",bg="transparent")
with(df, 
     plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="")
)
dev.off()