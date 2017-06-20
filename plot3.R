## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}
## Transform
NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))
NEI <- transform(NEI, type = factor(type))



require(ggplot2)



## Total emissions in Baltimore City
baltimore <- NEI[which(NEI$fips == 24510),]
baltimoreEmissions <- aggregate(Emissions ~ type + year, baltimore, sum)



## Plotting
png("./plot3.png")
plot3 <- ggplot(baltimoreEmissions, aes(year, Emissions, color = type))
plot3 <- plot3 + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total PM2.5 Emissions in Baltimore from 1999 to 2008")
print(plot3)
dev.off()