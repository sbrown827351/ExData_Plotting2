course2plot2 <- function() {
  
  #Read the files from the working directory
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
  
  
  #Build plot to answer question 2
  
  #Create subset of data
  subset <- NEI[NEI$fips=="24510", ]
  AnnualTotal <- aggregate(Emissions ~ year, subset, sum)
  
  #Create plot
  png('plot2.png')
  barplot(height=AnnualTotal$Emissions, names.arg=AnnualTotal$year, xlab="Year", ylab=expression('Total PM2.5 Emission'),main=expression('Total PM2.5 Emissions Per Year - Baltimore City'))
  dev.off()
  
}