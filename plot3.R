## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}



library(ggplot2)



## Total emissions in Baltimore City
baltimore <- NEI[which(NEI$fips == 24510),]
baltimore$year <- factor(baltimore$year, levels=c('1999', '2002', '2005', '2008'))



## Plotting
png("plot3.png", width=800, height=500, units='px')
ggplot(data=baltimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
    geom_boxplot(aes(fill = type)) + stat_boxplot(geom ='errorbar') +
    ylab('Log of PM2.5 Emissions in Baltimore(tons)') + xlab('Year') + 
    ggtitle('Total PM2.5 Emissions in Baltimore from 1999 to 2008') +
    geom_jitter(alpha=0.10)
dev.off()