# Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#             sources in Los Angeles County, California (fips == "06037"). 
#           Which city has seen greater changes over time in motor vehicle emissions?


#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Filter the data only for Baltimore fips = 24510 and California fips = 06037
NEI_BACA <- NEI[NEI$fips %in% c("24510", "06037"), ]

#Extract registers with Vehicles in EI.Sector
SCCOnlyVehicles = SCC[grepl("Vehicles", SCC$EI.Sector, ignore.case=TRUE),]

#Merge baltimore&California and SCCOnlyVehicles by the column SCC
NEI_BACA_OnlyVehicles <- merge(x=NEI_BACA, y=SCCOnlyVehicles, by='SCC')


#Sum Emissions by year 
NEI_BACA_OnlyVehiclesbyYear <- ddply(NEI_BACA_OnlyVehicles, .(year, fips), summarize, Emissions = sum(Emissions))

png("plot6.png", width = 600, height = 480)
qplot(year, Emissions, data = NEI_BACA_OnlyVehiclesbyYear, geom = c("point", "line"), ylab = "Total Emissions of PM", xlab = "Year", main = "Total Emissions by fips", facets = .~ fips)
dev.off()


