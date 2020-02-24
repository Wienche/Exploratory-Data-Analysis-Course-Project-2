## Loadig the data
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## Load library
library(ggplot2)

## Subset Balitmore data
NEI_baltimore <- NEI[NEI$fips=="24510",]

## Make graph
png("Plot3.png",width=480,height=480)
g <- ggplot(NEI_baltimore,aes(factor(year), Emissions, fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(.~type, scales="free", space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions in Baltimore from 1999 to 2008 by Source Type"))
print(g)
dev.off()
