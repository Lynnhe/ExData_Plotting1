plot1 <- function(){
	#data <- read.table("sample.txt",sep=";",header=TRUE)
	data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
	data <- data[grep("^1/2/2007|^2/2/2007",data$Date),]
	with(data,hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red"))
	dev.copy(png,file="plot1.png")
	dev.off()
}