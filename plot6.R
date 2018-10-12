course2plot6 <- function() {
  
  library(ggplot2)
  
  #Read the files from the working directory
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
  mergedData <- merge(NEI,SCC,by="SCC")
  
  #Build plot to answer question 5
  
  #Create subset of data
  subset <- NEI[NEI$fips=="24510"|NEI$fips=="06037" & NEI$type=="ON-ROAD", ]
  AnnualTotal <- aggregate(Emissions ~ year + fips, subset, sum)
  AnnualTotal$fips[AnnualTotal$fips=="24510"] <- "Baltimore"
  AnnualTotal$fips[AnnualTotal$fips=="06037"] <- "Los Angeles"
  
  #Create plot
  png('plot6.png')
  
  plot6 <- ggplot(AnnualTotal, aes(factor(year), Emissions))
  plot6 <- plot6 + facet_grid(.~fips)
  plot6 <- plot6 + geom_bar(stat='identity') + xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle('Total PM2.5 Emissions Per Year - Baltimore vs LA - On-Road Sources')
  print(plot6)
  
  dev.off()
  
}