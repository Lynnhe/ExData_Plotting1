plot2 <- function(){
	Sys.setlocale("LC_TIME","C")
	#data <- read.table("sample.txt",sep=";",header=TRUE)
	data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
	data <- data[grep("^1/2/2007|^2/2/2007",data$Date),]         #选择指定日期的数据
	data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")           #将日期和时间连接，然后格式转换
	with(data,plot(date_time,Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l"))      #type="l"指定划线，不画点
	dev.copy(png,file="plot2.png")
	dev.off()
}