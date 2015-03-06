## download and prepare data
dir.create("data", showWarnings=FALSE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/file.zip", method="curl")
unzip("data/file.zip",exdir="data/")
df <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ]
df$datetime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %T")

## plot
png(filename="plot3.png", width=480,height=480,units="px",bg="transparent")
yrange <- range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
with(df, {
     plot(datetime, Sub_metering_1, type="l", col="black", 
          ylab="Energy sub metering", xlab="", main="", ylim=yrange)
     par(new=TRUE)
     plot(datetime, Sub_metering_2, type="l", col="red", 
          ylab="", xlab="", main="", axes=FALSE, ylim=yrange)
     par(new=TRUE)
     plot(datetime, Sub_metering_3, type="l", col="blue", 
          ylab="", xlab="", main="", axes=FALSE, ylim=yrange)
     legend("topright", col=c("black","red","blue"), lty=c(1,1,1), 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()