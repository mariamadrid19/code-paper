library(viridis)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(ggpubr)

#generation of heatmaps for metabolites in green coffee, includes absolute abundace, relative abundance, and z-score normalization
heatmap_green_coffee <- as.data.frame(green_heatmap_2)
#group_sums <- tapply(heatmap_green_coffee$abundance, heatmap_green_coffee$sample, sum)
#heatmap_green_coffee$relative_abundance <- heatmap_green_coffee$abundance / group_sums[heatmap_green_coffee$sample]
#heatmap_green_coffee <- heatmap_green_coffee %>% 
#  group_by(sample) %>% 
#  mutate(relative_abundance = abundance / sum(abundance))
#write_xlsx(heatmap_green_coffee, "/Users/mariamadrid/Desktop/heatmap_green_coffee.xlsx")
ggplot(data=heatmap_green_coffee, aes(x=sample, y=metabolite,fill=relative_abundace)) + geom_tile() + scale_fill_viridis(option = "magma",direction=-1, begin = 0.3, end = 1)
ggplot(data=heatmap_green_coffee, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_viridis(option = "magma",direction=-1)
ggplot(data=heatmap_green_coffee, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)


#Separated by platforms
#lIQUIDS
heatmap_green_coffee_liquids <- subset(heatmap_green_coffee, platform != "GC-QTOF-MS")
ggplot(data=heatmap_green_coffee_liquids, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)

#GASES
gases <- 'GC'
heatmap_green_coffee_gases <- subset(heatmap_green_coffee, grepl(gases, platform) )
ggplot(data=heatmap_green_coffee_gases, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)


#pdf("NAME.pdf", width=10, height=8)
#plot
#dev.off()

#generation of heatmaps for metabolites in roasted coffee
heatmap_roasted_coffee <- as.data.frame(roasted_heatmap_2) #includes absolute, relative abundance, and z score norm
#group_sums <- tapply(heatmap_roasted_coffee$abundance, heatmap_roasted_coffee$sample, sum)
#heatmap_roasted_coffee$relative_abundance <- heatmap_roasted_coffee$abundance / group_sums[heatmap_roasted_coffee$sample]
#heatmap_roasted_coffee <- heatmap_roasted_coffee %>% 
#  group_by(sample) %>% 
#  mutate(relative_abundance = abundance / sum(abundance))
#write_xlsx(heatmap_roasted_coffee, "/Users/mariamadrid/Downloads/heatmap_roasted_coffee.xlsx")
ggplot(data=heatmap_roasted_coffee, aes(x=sample, y=metabolite,fill=relative_abundace)) + geom_tile() + scale_fill_viridis(option = "magma",direction=-1)
ggplot(data=heatmap_roasted_coffee, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_viridis(option = "magma",direction=-1)
ggplot(data=heatmap_roasted_coffee, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)


#Separated by platforms
#lIQUIDS
heatmap_roasted_coffee_liquids <- subset(heatmap_roasted_coffee, platform != "GC-QTOF-MS")
ggplot(data=heatmap_roasted_coffee_liquids, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)

#GASES
heatmap_roasted_coffee_gases <- subset(heatmap_roasted_coffee, grepl(gases, platform) )
ggplot(data=heatmap_roasted_coffee_gases, aes(x=sample, y=metabolite,fill=z_score_normalization)) + geom_tile() + scale_fill_distiller(palette = "RdBu", direction =-1)
