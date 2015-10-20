#Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?


#Load the data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#Extract registers with coal in Short Name
SCCOnlyCoal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#Merge NEI and SCCOnlyCoal by the column SCC
NEI_SCCOnlyCoal <- merge(x=NEI, y=SCCOnlyCoal, by='SCC')

#Sum Emissions by year 
NEI_SCCOnlyCoalbyYear <- ddply(NEI_SCCOnlyCoal, .(year), summarize, Emissions = sum(Emissions))


png("plot4.png", width = 600, height = 480)
plot(NEI_SCCOnlyCoalbyYear, type = "b", ylab = "Emissions PM25", xlab = "Year", main = "Annual Emissions Across United States from coal combustion-related sources")
dev.off()
