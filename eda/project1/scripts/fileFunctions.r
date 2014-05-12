checkFile <- function(fold,fileData, url){
    if (!file.exists(fold)){
       print("The folder does not exists, one will be created")
       dir.create(fold)
    }
    fullData = paste(fold , fileData,sep="/")
    if (!file.exists(fullData)){
        download.file(url,destfile=fullData)
        if (length(grep("zip",fileData)) >0){
            unzip(fullData,exdir=fold)
        }
    }
}

getPowerData <-function(){
  powerConsumptionUrl ="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  powerConsumptionFile ="household_power_consumption.zip"
  dataFolder ="./exp1"
  checkFile(dataFolder,powerConsumptionFile,powerConsumptionUrl)
  powerDataTxt ="household_power_consumption.txt"
  fullPowerFile =paste(dataFolder,powerDataTxt,sep="/")
  datesFilter = c("1/2/2007","2/2/2007")
  powerDataRaw= subset(read.table(fullPowerFile,sep=";",header=TRUE,na.strings="?",stringsAsFactors =FALSE),Date %in% datesFilter)
  powerDataRaw$DateTime = strptime(paste(powerDataRaw$Date,powerDataRaw$Time,sep=","), format="%d/%m/%Y,%H:%M:%S")
  powerDataRaw
}