histActive <-function(powerData){
  hist(powerData$Global_active_power,xlab="Global Active Power(kilowatts)",main="Global Active Power", col="red")
}

plotVoltage <-function(powerData){
  plot(powerData$DateTime,powerData$Voltage,xlab="Datetime",ylab="Voltage",type="l")
}

plotActivePower <- function(powerData){
  plot(powerData$DateTime,powerData$Global_active_power,ylab="Global Active Power(kilowatts)", type="l", xlab="")
}

plotSubmeter <- function(powerData){
  plot(powerData$DateTime,powerData$Sub_metering_1,xlab="",type="l",ylab="Energy submetering")
  lines(powerData$DateTime,powerData$Sub_metering_2,col="red")
  lines(powerData$DateTime,powerData$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
}

plotReactive <-function(powerData){
  plot(powerData$DateTime,powerData$Global_reactive_power,xlab="Datetime",ylab="Global_reactive_power",pch=20)
  lines(powerData$DateTime,powerData$Global_reactive_power)
}

plot1 <- function(powerData,folderOut){
  if (!file.exists(folderOut)){
    print("The folderof images does not exists, one will be created")
    dir.create(folderOut)
  }
  png(filename = paste(folderOut,"plot1.png",sep="/"))
  histActive(powerData)
  dev.off()
}

plot2 <- function(powerData,folderOut){
  if (!file.exists(folderOut)){
    print("The folderof images does not exists, one will be created")
    dir.create(folderOut)
  }
  png(filename = paste(folderOut,"plot2.png",sep="/"))
  plotActivePower(powerData)
  dev.off()
}  

plot3 <- function(powerData,folderOut){
  if (!file.exists(folderOut)){
    print("The folderof images does not exists, one will be created")
    dir.create(folderOut)
  }
  png(filename = paste(folderOut,"plot3.png",sep="/"))
  plotSubmeter(powerData)
  dev.off()
}  

plot4 <- function(powerData,folderOut){
  if (!file.exists(folderOut)){
    print("The folderof images does not exists, one will be created")
    dir.create(folderOut)
  }
  png(filename = paste(folderOut,"plot4.png",sep="/"))
  par(mfrow=c(2,2))
  plotActivePower(powerData)
  plotVoltage(powerData)
  plotSubmeter(powerData)
  plotReactive(powerData)
  dev.off()
}
  
