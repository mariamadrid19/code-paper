library(corrplot)

#correlation analyses
#import and organize data
correlation_16s_complete <- as.data.frame(correlation_16s)
rownames(correlation_16s_complete) <- correlation_16s_complete$Sample
correlation_16s_complete <- correlation_16s_complete[,-1]
correlation_its_complete <- as.data.frame(correlation_its)
rownames(correlation_its_complete) <- correlation_its_complete$Sample
correlation_its_complete <- correlation_its_complete[,-1]
correlation_microorganisms <- as.data.frame(correlation_microorganisms)
rownames(correlation_microorganisms) <- correlation_microorganisms$Sample
correlation_microorganisms <- correlation_microorganisms[,-1]

#generate correlation matrices and plots
cor_matrix_16s <- cor(correlation_16s_complete, method = "spearman")
corrplot(cor_matrix_16s,tl.cex = 0.8,tl.col="black", order="hclust", type="upper")
cor_matrix_its <- cor(correlation_its_complete, method = "spearman")
corrplot(cor_matrix_its,tl.cex = 0.8,tl.col="black", order="hclust", type="upper")
cor_matrix_microorganisms <- cor(correlation_microorganisms, method = "spearman")
corrplot(cor_matrix_microorganisms, tl.cex = 0.8,tl.col="black", order="hclust", type="upper")
