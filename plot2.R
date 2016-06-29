data                 <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,na.strings="?")     # read de data
data.subset          <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")						  	# subset only the days used in the project to speed things
data.subset$DateTime <- as.POSIXct(paste(data.subset$Date,data.subset$Time),format="%d/%m/%Y %T")			# create the field DateTime as POSIXct data type
data.for.plot        <- data.subset[,c(10,3:9)]												# select for the graphics only the fields used (the created DateTime and the numeric)

with (data.for.plot,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))	# making the graphic
dev.copy(png,file="plot2.png",width=480,height=480)														# copying the graphic to a png file
dev.off()																		# closing the device
