main <- function(){
  source("./scripts/fileFunctions.r")
  source("./scripts/plot1_eda.r")
  powerData = getPowerData()
  plot1(powerData,"./images")
  plot2(powerData,"./images")
  plot3(powerData,"./images")
  plot4(powerData,"./images")
}