## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Total emissions in Baltimore City
NEI_Baltimore <- NEI[which(NEI$fips == 24510),]
SumBaltimoreEmissions <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

## Make graph
png("Plot2.png",width=480,height=480)
barplot(SumBaltimoreEmissions$Emissions, 
        xlab="Year", 
        ylab="Total PM2.5 Emissions in Baltimore(tons)", 
        main = "Total PM2.5 Emissions in Baltimore from 1999 to 2008", 
        names.arg = SumBaltimoreEmissions$year)
dev.off()