## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Subset Baltimore Onroad
NEI_Baltimore_Onroad <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",  ]

SumBaltimoreOnroad <- aggregate(Emissions ~ year, NEI_Baltimore_Onroad, sum)

## Load library
library(ggplot2)

## Make graph
png("Plot5.png",width=480,height=480)
g <- ggplot(SumBaltimoreOnroad, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle in Baltimore from 1999 to 2008')
print(g)
dev.off()