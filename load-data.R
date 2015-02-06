##Loading data and get required subset data
if(!file.exists("data/data.csv")) {

  #create directory if not exist
  if(!file.exists("data")){
    dir.create("data")
  }
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #download from url and unzip to destination directory
  download.file(url, destfile = "data/household_power_consumption.zip", method = "curl")
  unzip("data/household_power_consumption.zip", exdir = "data")
  
  # load the dataset
  dataset <- read.table("data/household_power_consumption.txt", header = TRUE, sep  = ";", na.strings = "?")
  dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
  # subset the required dataset
  data <- subset(dataset, dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02")
  
  write.csv(data, "data/data.csv")
  #remove dataset to release the memory, because we don't need it
  rm(dataset)
} else {
  data<- read.csv("data/data.csv", header = TRUE, na.strings = "?")
}