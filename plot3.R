plot3 <- function(){
	Sys.setlocale("LC_TIME","C")
	data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
	data <- data[grep("^1/2/2007|^2/2/2007",data$Date),]         #选择指定日期的数据
	data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")           #将日期和时间连接，然后格式转换
	with(data,plot(date_time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black"))      #type="l"指定划线，不画点
	with(data,lines(date_time,Sub_metering_2,col="red"))      
	with(data,lines(date_time,Sub_metering_3,col="blue"))     
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
	dev.copy(png,file="plot3.png")
	dev.off()
}