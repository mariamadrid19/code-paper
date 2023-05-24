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

#correlation plot, bacteria co-occurence/co-exclusion
cor_matrix_16s <- cor(correlation_16s, method = "spearman")
corrplot(cor_matrix_16s,tl.col="black",order="hclust",type="upper")

#correlation plot, green coffee vs yeast
cor_matrix_green_its <- cor(correlation_its,correlation_green, method = "spearman")
corrplot(cor_matrix_green_its,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#correlation plot, roasted coffee vs yeast
cor_matrix_roasted_its <- cor(correlation_its,correlation_roasted, method = "spearman")
corrplot(cor_matrix_roasted_its,tl.cex = 0.6,tl.col="black",is.corr=FALSE)

#correlation plot, yeast co-occurence/co-exclusion
cor_matrix_its <- cor(correlation_its, method = "spearman")
corrplot(cor_matrix_its,tl.col="black",order="hclust",type="upper")

#correlation plot, bacteria vs yeast
cor_matrix_its_16s <- cor(correlation_its,correlation_16s, method = "spearman")
corrplot(cor_matrix_its_16s,tl.cex = 0.6,tl.col="black",is.corr=FALSE)
