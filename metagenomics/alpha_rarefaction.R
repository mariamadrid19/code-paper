library(dplyr)
library(ggplot2)
library(qiime2R)
library(phyloseq)
library(tidyverse)
library(ranacapa)

#Create physeq object from qiime2 artifact, 16S
physeq_16S_no_SC<-qza_to_phyloseq(
  features="/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/final-filtered-table-16s.qza",
  tree="/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/rooted-tree-16s.qza",
  taxonomy = "/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/silva-138-99-tax-515-806.qza",
  metadata = "/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/sample-metadata-16s.tsv")

#generate curve with ggrare (from the ranacapa package)
a_rarefaction_16s <-ggrare(physeq_16S_no_SC, step = 10, color = "Sample", label = "Sample", se = TRUE)
a_rarefaction_16s + theme_minimal() + theme(legend.position = "none") 

#Create physeq object from qiime2 artifact, ITS 
physeq_ITS_no_SC<-qza_to_phyloseq(
  features="/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/table-its.qza",
  tree="/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/rooted-tree-its.qza",
  taxonomy = "/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/unite-its-tax.qza",
  metadata = "/Users/mariamadrid/Documents/tesis/metagenomica/strict-denoising/no_SC_analysis/sample-metadata-its.tsv")

#generate curve with ggrare
a_rarefaction_its <-ggrare(physeq_ITS_no_SC, step = 10, color = "Sample", label = "Sample", se = TRUE)
a_rarefaction_its + theme_minimal() + theme(legend.position = "none") 
