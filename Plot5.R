#Question 5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Filter the data only for Baltimore fips = 24510

baltimore <- NEI[which(NEI$fips == "24510"), ]

#Extract registers with Vehicles in EI.Sector
SCCOnlyVehicles = SCC[grepl("Vehicles", SCC$EI.Sector, ignore.case=TRUE),]

#Merge baltimore and SCCOnlyVehicles by the column SCC
baltimoreOnlyVehicles <- merge(x=baltimore, y=SCCOnlyVehicles, by='SCC')

#Sum Emissions by year 
baltimoreOnlyVehiclesbyYear <- ddply(baltimoreOnlyVehicles, .(year), summarize, Emissions = sum(Emissions))

png("plot5.png", width = 600, height = 480)
plot(baltimoreOnlyVehiclesbyYear, type = "b", ylab = "Emissions PM25", xlab = "Year", main = "Annual Emissions from motor vehicle in Baltimore City")
dev.off()