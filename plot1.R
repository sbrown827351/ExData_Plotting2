course2plot1 <- function() {

#Read the files from the working directory
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
  

#Build plot to answer question 1
AnnualTotal <- aggregate(Emissions ~ year, NEI, sum)
png('plot1.png')
barplot(height=AnnualTotal$Emissions, names.arg=AnnualTotal$year, xlab="Year", ylab=expression('Total PM2.5 Emission'),main=expression('Total PM2.5 Emissions Per Year'))
dev.off()

}