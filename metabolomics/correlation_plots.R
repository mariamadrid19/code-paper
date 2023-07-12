library(corrplot)

#correlation analyses for (green) metabolites and bacteria
correlation_16s <- as.data.frame(correlation_16s)
correlation_green <- as.data.frame(correlation_green)
correlation_roasted <- as.data.frame(correlation_roasted)
correlation_its <- as.data.frame(correlation_its)
rownames(correlation_16s) <- correlation_16s$Sample
correlation_16s <- correlation_16s[,-1]
str(correlation_16s)
rownames(correlation_green) <- correlation_green$Sample
correlation_green <- correlation_green[,-1]
str(correlation_green)
rownames(correlation_roasted) <- correlation_roasted$Sample
correlation_roasted <- correlation_roasted[,-1]
str(correlation_roasted)
rownames(correlation_its) <- correlation_its$Sample
correlation_its <- correlation_its[,-1]
str(correlation_its)

#correlation plot, green coffee vs bacteria
cor_matrix_green_16s <- cor(correlation_16s,correlation_green, method = "spearman")
corrplot(cor_matrix_green_16s,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#correlation plot, roasted coffee vs bacteria
cor_matrix_roasted_16s <- cor(correlation_16s,correlation_roasted, method = "spearman")
corrplot(cor_matrix_roasted_16s,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#correlation plot, green coffee vs yeast
cor_matrix_green_its <- cor(correlation_its,correlation_green, method = "spearman")
corrplot(cor_matrix_green_its,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#correlation plot, roasted coffee vs yeast
cor_matrix_roasted_its <- cor(correlation_its,correlation_roasted, method = "spearman")
corrplot(cor_matrix_roasted_its,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#Correlation plot, roasted coffee vs all mos, IW
corr_mos_RIW <- as.data.frame(corr_mos_RIW)
rownames(corr_mos_RIW) <- corr_mos_RIW$Sample
corr_mos_RIW <- corr_mos_RIW[,-1]
str(corr_mos_RIW)
corr_RIW <- as.data.frame(corr_RIW)
rownames(corr_RIW) <- corr_RIW$Sample
corr_RIW <- corr_RIW[,-1]
str(corr_RIW)
cor_matrix_all_mos_RIW <- cor(corr_mos_RIW,corr_RIW, method = "spearman")
corrplot(cor_matrix_all_mos_RIW,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#Correlation plot, roasted coffee vs all mos, SW
corr_mos_RSW <- as.data.frame(corr_mos_RSW)
rownames(corr_mos_RSW) <- corr_mos_RSW$Sample
corr_mos_RSW <- corr_mos_RSW[,-1]
str(corr_mos_RSW)
corr_RSW <- as.data.frame(corr_RSW)
rownames(corr_RSW) <- corr_RSW$Sample
corr_RSW <- corr_RSW[,-1]
str(corr_RSW)
cor_matrix_all_mos_RSW <- cor(corr_mos_RSW,corr_RSW, method = "spearman")
corrplot(cor_matrix_all_mos_RSW,tl.cex = 0.6,tl.col="black",is.corr=FALSE)


#Correlation plot, green coffee vs all mos, IW
corr_mos_GIW <- as.data.frame(corr_mos_GIW)
rownames(corr_mos_GIW) <- corr_mos_GIW$Sample
corr_mos_GIW <- corr_mos_GIW[,-1]
str(corr_mos_GIW)
corr_GIW <- as.data.frame(corr_GIW)
rownames(corr_GIW) <- corr_GIW$Sample
corr_GIW <- corr_GIW[,-1]
str(corr_GIW)
cor_matrix_all_mos_GIW <- cor(corr_mos_GIW,corr_GIW, method = "spearman")
corrplot(cor_matrix_all_mos_GIW,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#Correlation plot, green coffee vs all mos, SW
corr_mos_GSW <- as.data.frame(corr_mos_GSW)
rownames(corr_mos_GSW) <- corr_mos_GSW$Sample
corr_mos_GSW <- corr_mos_GSW[,-1]
str(corr_mos_GSW)
corr_GSW <- as.data.frame(corr_GSW)
rownames(corr_GSW) <- corr_RIW$Sample
corr_GSW <- corr_GSW[,-1]
str(corr_GSW)
cor_matrix_all_mos_RSW <- cor(corr_mos_GSW,corr_GSW, method = "spearman")
corrplot(cor_matrix_all_mos_RSW,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

