library(writexl)
library(dplyr)
library(ggplot2)
library(dplyr)
library(ggpubr)
library(RColorBrewer)
library(Heatplus)
library(gplots)

#Create a HEATMAP
#Import data
new_TAXA16S_50_100 <- as.data.frame(new_TAXA16S_50_100)
row.names(new_TAXA16S_50_100) <- new_TAXA16S_50_100$'Sample'
new_TAXA16S_50_100 <- new_TAXA16S_50_100[,-1]
complete_taxa_16s_50_100 <- as.data.frame(new_TAXA16S_50_100)

scalecolors2 <- colorRampPalette(c("moccasin", "orange1", "orangered2", "red", "red1","red2","red3"), space = "rgb")(100)

#Determinar la abundancia máxima relativa para cada columna (0-1)
complete_taxa_16s_50_100 <- complete_taxa_16s_50_100/rowSums(complete_taxa_16s_50_100)
maximum_abundance_16s_50_100 <- apply(complete_taxa_16s_50_100, 2, max)
head(maximum_abundance_16s_50_100)

#Se filtra la tabla. Se eliminan los géneros con menos de 1% como su abundancia máxima relativa
n1_16s_50_100 <- names(which(maximum_abundance_16s_50_100 < 0.01))
new_TAXA16S_50_100 <- complete_taxa_16s_50_100[, -which(names(complete_taxa_16s_50_100) %in% n1_16s_50_100)]

#First heatmap, no clustering, 1% abundance or more (>0.01)
heatmap(as.matrix(new_TAXA16S_50_100), Rowv = NA, Colv = NA, col = scalecolors2, margins = c(10, 2))

#Calculate Bray-Curtis disimilarity matrix
data_dist_16s_50_100 <- vegdist(complete_taxa_16s_50_100, method = "bray")

#Se hace un clustering jerárquico por ligaje. 
row_clus_16s_50_100 <- hclust(data_dist_16s_50_100, "aver")

#Nuevo heat map incluyendo un dendrograma para las muestras (como se relacionan entre ellas).
#Esto desorganiza el orden de las muestras 
heatmap(as.matrix(new_TAXA16S_50_100), Rowv = as.dendrogram(row_clus_16s_50_100), Colv = NA, col = scalecolors2, margins = c(10, 3))

#Ahora se hace un dendrograma para los géneros que ocurren más frecuentemente juntos
data_dist_g_16s_50_100 <- vegdist(t(new_TAXA16S_50_100), method = "bray")
col_clus_16s_50_100 <- hclust(data_dist_g_16s_50_100, "aver")

scalecolors3 <- colorRampPalette(c( "white", "red", "red1","red2","red3", "red4"), space = "rgb")(100)

#Se genera el heatmap final
pdf("heatmap_heatplus_16s_50_100.pdf", width=18, height=15)
heatmap.2(as.matrix(new_TAXA16S_50_100),Rowv = NA, Colv = as.dendrogram(col_clus_16s_50_100), 
          col = scalecolors3, trace = "none", density.info = "none", ylab = "Samples", 
          main = "16S 50h vs 100h", lhei = c(1, 3))
dev.off()

#Import data
new_TAXAITS_50_100 <- as.data.frame(new_TAXAITS_50_100)
row.names(new_TAXAITS_50_100) <- new_TAXAITS_50_100$'Sample'
new_TAXAITS_50_100 <- new_TAXAITS_50_100[,-1]
complete_taxa_its_50_100 <- as.data.frame(new_TAXAITS_50_100)

#First heatmap, no clustering, 1% abundance or more (>0.01)
heatmap(as.matrix(new_TAXAITS_50_100), Rowv = NA, Colv = NA, col = scalecolors2, margins = c(10, 2))

#Calculate Bray-Curtis disimilarity matrix
data_dist_its_50_100 <- vegdist(complete_taxa_its_50_100, method = "bray")

#Se hace un clustering jerárquico por ligaje. 
row_clus_its_50_100 <- hclust(data_dist_its_50_100, "aver")

#Nuevo heat map incluyendo un dendrograma para las muestras (como se relacionan entre ellas).
#Esto desorganiza el orden de las muestras 
heatmap(as.matrix(new_TAXAITS_50_100), Rowv = as.dendrogram(row_clus_its_50_100), Colv = NA, col = scalecolors2, margins = c(10, 3))

#Ahora se hace un dendrograma para los géneros que ocurren más frecuentemente juntos
data_dist_g_its_50_100 <- vegdist(t(new_TAXAITS_50_100), method = "bray")
col_clus_its_50_100 <- hclust(data_dist_g_its_50_100, "aver")

#Se genera el heatmap final
pdf("heatmap_heatplus_its_50_100.pdf", width=18, height=15)
heatmap.2(as.matrix(new_TAXAITS_50_100),Rowv = NA, Colv = as.dendrogram(col_clus_its_50_100), 
          col = scalecolors3, trace = "none", density.info = "none", ylab = "Samples", 
          main = "ITS 50h vs 100h", lhei = c(1, 3))
dev.off()
