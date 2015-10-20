#Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#First I need sum the Emission per year
indexPM25byYear <- with(NEI, aggregate(Emissions, by = list(year), sum))

# I use the function plot included n the base package
png("plot1.png", width = 480, height = 480)
plot(indexPM25byYear, type = "b", ylab = "Emissions PM25", xlab = "Year", main = "Annual Emissions")
dev.off()

