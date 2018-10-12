course2plot5 <- function() {
  
  library(ggplot2)
  
  #Read the files from the working directory
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
  mergedData <- merge(NEI,SCC,by="SCC")
  
  #Build plot to answer question 5
  
  #Create subset of data
  subset <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
  AnnualTotal <- aggregate(Emissions ~ year, subset, sum)
  
  #Create plot
  png('plot5.png')
  
  plot5 <- ggplot(AnnualTotal, aes(year, Emissions))
  plot5 <- plot5 + geom_bar(stat='identity') + xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle('Total PM2.5 Emissions Per Year - Baltimore City from On-Road Sources')
  print(plot5)
  
  dev.off()
  
}