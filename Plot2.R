#Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Filter the data only for Baltimore fips = 24510

baltimore <- NEI[which(NEI$fips == "24510"), ]

# Now I can to sum the Emission per year
baltimorebyYear <- ddply(baltimore, .(year), summarize, Emissions = sum(Emissions))

# I use the function plot included n the base package
png("plot2.png", width = 480, height = 480)
plot(indexPM25byYearinBaltimore, type = "b", ylab = "Emissions PM25", xlab = "Year", main = "Annual Emissions in Baltimore")
dev.off()