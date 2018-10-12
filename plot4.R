course2plot4 <- function() {
  
  library(ggplot2)
  
  #Read the files from the working directory
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
  mergedData <- merge(NEI,SCC,by="SCC")
  
  #Build plot to answer question 4
  
  #Create subset of data
  coal <- grepl("coal",mergedData$Short.Name,ignore.case=TRUE)
  subset <- mergedData[coal, ]
  AnnualTotal <- aggregate(Emissions ~ year, subset, sum)
  
  #Create plot
  png('plot4.png')
  
  plot4 <- ggplot(AnnualTotal, aes(year, Emissions))
  plot4 <- plot4 + geom_bar(stat='identity') + xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle('Total PM2.5 Emissions Per Year - Coal')
  print(plot4)
  
  dev.off()
  
}