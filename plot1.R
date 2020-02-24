## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Total emissions
SumEmissions <- aggregate(Emissions ~ year, NEI, sum)

## Make graph
png("Plot1.png",width=480,height=480)
barplot(SumEmissions$Emissions, 
        xlab="Year", ylab="Total PM2.5 Emissions (tons)", 
        main = "Total PM2.5 Emissions from 1999 to 2008", 
        names.arg = SumEmissions$year)
dev.off()