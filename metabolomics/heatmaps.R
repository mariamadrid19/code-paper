library(viridis)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(ggpubr)

###code for metabolomics analyses
##generation of heatmaps for metabolites in green coffee
heatmap_green_coffee <- as.data.frame(green_heatmap)
group_sums <- tapply(heatmap_green_coffee$abundance, heatmap_green_coffee$sample, sum)
heatmap_green_coffee$relative_abundance <- heatmap_green_coffee$abundance / group_sums[heatmap_green_coffee$sample]
heatmap_green_coffee <- heatmap_green_coffee %>% 
  group_by(sample) %>% 
  mutate(relative_abundance = abundance / sum(abundance))
heatmap_green_coffee_liquids <- subset(heatmap_green_coffee, platform != "GC-QTOF-MS")
heatmap_green_coffee_gases <- subset(heatmap_green_coffee, platform == "GC-QTOF-MS")
ggplot(data=heatmap_green_coffee, aes(x=sample, y=metabolite,fill=relative_abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")
ggplot(data=heatmap_green_coffee_liquids, aes(x=sample, y=metabolite,fill=abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")
ggplot(data=heatmap_green_coffee_gases, aes(x=sample, y=metabolite,fill=abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")

##generation of heatmaps for metabolites in roasted coffee
heatmap_roasted_coffee <- as.data.frame(roasted_heatmap)
group_sums <- tapply(heatmap_roasted_coffee$abundance, heatmap_roasted_coffee$sample, sum)
heatmap_roasted_coffee$relative_abundance <- heatmap_roasted_coffee$abundance / group_sums[heatmap_roasted_coffee$sample]
heatmap_roasted_coffee <- heatmap_roasted_coffee %>% 
  group_by(sample) %>% 
  mutate(relative_abundance = abundance / sum(abundance))
ggplot(data=heatmap_roasted_coffee, aes(x=sample, y=metabolite,fill=relative_abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")
heatmap_roasted_coffee_liquids <- subset(heatmap_roasted_coffee, platform != "GC-QTOF-MS")
heatmap_roasted_coffee_gases <- subset(heatmap_roasted_coffee, platform == "GC-QTOF-MS")
ggplot(data=heatmap_roasted_coffee_liquids, aes(x=sample, y=metabolite,fill=abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")
ggplot(data=heatmap_roasted_coffee_gases, aes(x=sample, y=metabolite,fill=abundance)) + geom_tile() + 
  scale_fill_viridis(option = "plasma")
