#generate new barplots using ggplot
#change to a data frame
barplots_ITS <- as.data.frame(its_complete_barplots_2)

#convert 'taxa' to factor and specify level order
barplots_ITS$Taxa <- factor(barplots_ITS$Taxa, levels=c('Added_yeast','Saccharomyces','Fusarium','Nectriaceae',
                                                        'Fungi','Candida','Fusarium_sp.','Others',
                                                        'Kluyveromyces_marxianus','Cordyceps_bassiana',
                                                        'Hanseniaspora_nectarophila','Hanseniaspora',
                                                        'Fusarium_solani','Meyerozyma_guilliermondii',
                                                        'Candida_tropicalis','Kazachstania_exigua',
                                                        'Kurtzmaniella','Wickerhamomyces_anomalus',
                                                        'Torulaspora_delbrueckii','Saccharomycetales','Kazachstania_humilis'))



#make palette using the randomcoloR package, distinctColorPalette (ITS has 20 taxa)
#make barplots using ggplot2
n_its <- 21
palette_barplots_its <- distinctColorPalette(n_its)
barplot_ITS_full <- ggplot(barplots_ITS, aes(x=Sample, y=Abundance, fill=Taxa)) + 
  geom_bar(stat="identity") +
  theme_minimal()+
  scale_fill_manual(values = palette_barplots_its, name = "Taxa")
barplot_ITS_full

#export barplot to PDF
pdf("barplot_its.pdf", width=18, height=8)
barplot_ITS_full
dev.off()

#make barplots
#make palette using the randomcoloR package, distinctColorPalette (16S has 18 taxa)
#make barplots using ggplot2
n_16s <- 18
palette_barplots_16s <- distinctColorPalette(n_16s)
barplot_16s_full <- ggplot(barplots_16s, aes(x=Sample, y=Abundance, fill=fct_reorder(Taxa, Abundance)))+ 
  geom_bar(stat="identity")+
  theme_minimal()+
  scale_fill_manual(values = palette_barplots_16s, name = "Taxa")
barplot_16s_full

#export barplot to PDF
pdf("barplot_16s_full.pdf", width=18, height=8)
barplot_16s_full
dev.off()
