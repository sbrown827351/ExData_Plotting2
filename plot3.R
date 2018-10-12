course2plot3 <- function() {
  
  library(ggplot2)
  
  #Read the files from the working directory
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
  
  
  #Build plot to answer question 3
  
  #Create subset of data
  subset <- NEI[NEI$fips=="24510", ]
  AnnualTotal <- aggregate(Emissions ~ year + type, subset, sum)
  
  #Create plot
  png('plot3.png')
  
  plot3 <- ggplot(AnnualTotal, aes(year, Emissions, color = type))
  plot3 <- plot3 + geom_line() + xlab("Year") + ylab(expression('Total PM2.5 Emissions')) + ggtitle('Total PM2.5 Emissions Per Year - Baltimore City')
  print(plot3)
  
  dev.off()
  
}