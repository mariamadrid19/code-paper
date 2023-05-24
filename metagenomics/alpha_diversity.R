chao1_its <- subset(alpha_its, Test == "Chao1")
obs_its <- subset(alpha_its, Test == "Observed")
shannon_its <- subset(alpha_its, Test == "Shannon")
simpson_its <- subset(alpha_its, Test == "Simpson")
chao1_16s <- subset(alpha_16s, Test == "Chao1")
observed_16s <- subset(alpha_16s, Test == "Observed")
shannon_16s <- subset(alpha_16s, Test == "Shannon")
simpson_16s <- subset(alpha_16s, Test == "Simpson")

chao1_its$Group <- as.factor(chao1_its$Group)
obs_its$Group <- as.factor(obs_its$Group) 
shannon_its$Group <- as.factor(shannon_its$Group) 
simpson_its$Group <- as.factor(simpson_its$Group) 
chao1_16s$Group <- as.factor(chao1_16s$Group) 
observed_16s$Group <- as.factor(observed_16s$Group) 
shannon_16s$Group <- as.factor(shannon_16s$Group) 
simpson_16s$Group <- as.factor(simpson_16s$Group)

chao1_its$Type <- as.factor(chao1_its$Type) 
obs_its$Type <- as.factor(obs_its$Type)
shannon_its$Type <- as.factor(shannon_its$Type)  
simpson_its$Type <- as.factor(simpson_its$Type) 
chao1_16s$Type <- as.factor(chao1_16s$Type) 
shannon_16s$Type <- as.factor(shannon_16s$Type)  
simpson_16s$Type <- as.factor(simpson_16s$Type) 
simpson_its$Type <- as.factor(simpson_its$Type) 
observed_16s$Type <- as.factor(observed_16s$Type)

#VIOLIN PLOTS
#OBSERVED
obs_16s_plot <- ggviolin(observed_16s, x = "Type", y = "Score",
                             add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                             fill = "Group",xlab="Fermentation type",ylab="Observed") 
obs_16s_plot <- obs_16s_plot + stat_compare_means() #add stats

#CHAO1
chao1_16s_plot_2 <- ggviolin(chao1_16s, x = "Type", y = "Score",
                           add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                           fill = "Group",xlab="Fermentation type",ylab="Chao1") 
chao1_16s_plot_2 <- chao1_16s_plot_2 + stat_compare_means() #add stats

#SHANNON
shannon_16s_plot_2 <- ggviolin(shannon_16s, x = "Type", y = "Score",
                               add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                               fill = "Group",xlab="Fermentation type",ylab="Shannon") 
shannon_16s_plot_2 <- shannon_16s_plot_2 + stat_compare_means() #add stats

#SIMPSON
simpson_16s_plot_2 <- ggviolin(simpson_16s, x = "Type", y = "Score",
                               add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                               fill = "Group",xlab="Fermentation type",ylab="Simpson") 
#add stats
simpson_16s_plot_2 <- simpson_16s_plot_2 + stat_compare_means() 

alpha_plots_16s_TYPE <- ggarrange(obs_16s_plot, shannon_16s_plot_2 + rremove("x.text"), 
                             ncol = 2, nrow = 1, legend = FALSE)
pdf("alpha_plots_16s_TYPE.pdf", width=10, height=8)
alpha_plots_16s_TYPE
dev.off()

#VIOLIN PLOTS
#CHAO1
chao1_its_plot_2 <- ggviolin(chao1_its, x = "Type", y = "Score",
                             add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                             fill = "Group",xlab="Fermentation type",ylab="Chao1") 
chao1_its_plot_2 <- chao1_its_plot_2 + stat_compare_means() #add stats

#OBSERVED
obs_its_plot <- ggviolin(obs_its, x = "Type", y = "Score",
                             add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                             fill = "Group",xlab="Fermentation type",ylab="Observed") 
obs_its_plot <- obs_its_plot + stat_compare_means() #add stats

#SHANNON
shannon_its_plot_2 <- ggviolin(shannon_its, x = "Type", y = "Score",
                               add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                               fill = "Group",xlab="Fermentation type",ylab="Shannon") 
shannon_its_plot_2 <- shannon_its_plot_2 + stat_compare_means() #add stats

#SIMPSON
simpson_its_plot_2 <- ggviolin(simpson_its, x = "Type", y = "Score",
                               add = "boxplot", palette = c("#FCFDBF","#F7765B","#D3436E"), 
                               fill = "Group",xlab="Fermentation type",ylab="Simpson") 
#add stats
simpson_its_plot_2 <- simpson_its_plot_2 + stat_compare_means() 

alpha_plots_its_TYPE <- ggarrange(obs_its_plot, shannon_its_plot_2 + rremove("x.text"), 
                                  ncol = 2, nrow = 1, legend = "right", common.legend = TRUE)
pdf("alpha_plots_its_TYPE.pdf", width=10, height=8)
alpha_plots_its_TYPE
dev.off()

diversity_plots <- ggarrange(alpha_plots_16s_TYPE, alpha_plots_its_TYPE + rremove("x.text"), 
                                  labels = c("A", "B"),
                                  ncol = 2, nrow = 1)
pdf("figure-6.pdf", width=20, height=8)
diversity_plots
dev.off()
