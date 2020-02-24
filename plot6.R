## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Subset Two cities Onroad

NEI_Cities_Onroad <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

SumCitiesEmissions <- aggregate(Emissions ~ year + fips, NEI_Cities_Onroad, sum)
SumCitiesEmissions$fips[SumCitiesEmissions$fips=="24510"] <- "Baltimore, MD"
SumCitiesEmissions$fips[SumCitiesEmissions$fips=="06037"] <- "Los Angeles, CA"

## Load library
library(ggplot2)

## Make graph
png("Plot6.png",width=480,height=480)
g <- ggplot(SumCitiesEmissions, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle in Baltimore vs Los Angeles from 1999 to 2008')
print(g)
dev.off()