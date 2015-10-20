# Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 

#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Filter the data only for Baltimore fips = 24510

baltimore <- NEI[which(NEI$fips == "24510"), ]

baltimorebyType <- ddply(baltimore, .(type, year), summarize, Emissions = sum(Emissions))
library(plyr)
library(ggplot2)

png("plot3.png", width = 480, height = 480)
qplot(year, Emissions, data = baltimorebyType, geom = c("point", "line"), ylab = "Total Emissions of PM", xlab = "Year", main = "Total Emissions in Baltimore by Type of Pollutant", facets = .~ type)
dev.off()
