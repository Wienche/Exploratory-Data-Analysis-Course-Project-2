## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
    NEISCC <- merge(NEI, SCC, by="SCC")
}

## Subset rows that contain coal
ContainsCoal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
CoalOnly <- NEISCC[ContainsCoal, ]
SumCoalEmissions <- aggregate(Emissions ~ year, CoalOnly, sum)

## Load library
library(ggplot2)

## Make graph
png("Plot4.png",width=480,height=480)
g <- ggplot(SumCoalEmissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total PM2.5 Emissions from Coal Sources from 1999 to 2008')
print(g)
dev.off()