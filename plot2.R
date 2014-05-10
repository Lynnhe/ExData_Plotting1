plot2 <- function(){
	Sys.setlocale("LC_TIME","C")
	#data <- read.table("sample.txt",sep=";",header=TRUE)
	data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
	data <- data[grep("^1/2/2007|^2/2/2007",data$Date),]         #ѡ��ָ�����ڵ�����
	data$date_time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")           #�����ں�ʱ�����ӣ�Ȼ���ʽת��
	with(data,plot(date_time,Global_active_power,xlab="",ylab="Global Active Power(kilowatts)",type="l"))      #type="l"ָ�����ߣ�������
	dev.copy(png,file="plot2.png")
	dev.off()
}