#Example to show how to compare the abundance between 2 groups (t test)
subset_data_k_humilis <- subset(its_complete_barplots_2, Taxa == "Kazachstania_humilis" & 
                        Sample %in% c("IW2.1", "IW2.2", "IW2.3", "SW2.1", "SW2.2", "SW2.3"))
subset_data_k_humilis
t.test(Abundance ~ Group, data = subset_data_k_humilis,var.equal = TRUE)

#Compare more than 2 groups
subset_data_Saccharomycetales <- subset(its_complete_barplots_2, Taxa == "Saccharomycetales" & 
                                  Sample %in% c("IW2.1", "IW2.2", "IW2.3", "IW3.1", "IW3.2", "IW3.3",
                                                "SW2.1", "SW2.2", "SW2.3","SW3.1", "SW3.2", "SW3.3"))
subset_data_Saccharomycetales

model <- aov(Abundance ~ Group, data = subset_data_Saccharomycetales)
summary(model)
TukeyHSD(model)

#This test will allow me to see if the abundance of Kazachstania humilis decreased significantly or not
subset_data_k_humilis <- subset(its_complete_barplots_2, Taxa == "Kazachstania_humilis" & 
                                  Group %in% c("IW2","IW3","IW4","IW5","SW2","SW3","SW4","SW5"))
exp = rep(c("50I","100I","50S","100S"),each=6)
subset_data_k_humilis <- cbind(subset_data_k_humilis,exp)
model <- aov(Abundance ~ exp, data = subset_data_k_humilis)
summary(model)
TukeyHSD(model)


subset_data_hour_50 <- subset(X16s_complete_barplots, Taxa == "Leuconostoc" & 
                                  Sample %in% c("IW1.1", "IW1.2", "IW1.3","IW2.1", "IW2.2", "IW2.3", "IW3.1", "IW3.2", "IW3.3", 
                                                "SW1.1", "SW1.2", "SW1.3", "SW2.1", "SW2.2", "SW2.3","SW3.1", "SW3.2", "SW3.3"))
subset_data_hour_50
exp_lact <- c("0I","0I","0I",rep(c("50I"),each=6),"0W","0W","0W",rep(c("50W"),each=6))
exp_lact
subset_data_hour_50 <- cbind(subset_data_hour_50,exp_lact)
subset_data_hour_50
model_hour_50 <- aov(Abundance ~ exp_lact, data = subset_data_hour_50)
summary(model_hour_50)
TukeyHSD(model_hour_50)

subset_data_hour_50_MORE <- subset(subset_data_hour_50, exp_lact != "0I")
subset_data_hour_50_MORE <- subset(subset_data_hour_50_MORE, exp_lact != "50I")
t.test(Abundance ~ exp_lact, data = subset_data_hour_50_MORE,var.equal = TRUE)
subset_data_hour_50_MORE <- subset(subset_data_hour_50, exp_lact != "0W")
subset_data_hour_50_MORE <- subset(subset_data_hour_50_MORE, exp_lact != "50W")
t.test(Abundance ~ exp_lact, data = subset_data_hour_50_MORE,var.equal = TRUE)


subset_data_hour_50_3 <- subset(its_complete_barplots_2, Taxa == "Saccharomycetales" & 
                                Sample %in% c("IW1.1", "IW1.2", "IW1.3","IW2.1", "IW2.2", "IW2.3", "IW3.1", "IW3.2", "IW3.3", 
                                              "SW1.1", "SW1.2", "SW1.3", "SW2.1", "SW2.2", "SW2.3","SW3.1", "SW3.2", "SW3.3"))
subset_data_hour_50_3
exp_k_h <- c("0I","0I","0I",rep(c("50I"),each=6),"0W","0W","0W",rep(c("50W"),each=6))
exp_k_h
subset_data_hour_50_3 <- cbind(subset_data_hour_50_3,exp_k_h)
subset_data_hour_50_3
model_hour_50_3 <- aov(Abundance ~ exp_k_h, data = subset_data_hour_50_3)
summary(model_hour_50_3)
TukeyHSD(model_hour_50_3)

subset_data_hour_50_3_MORE <- subset(subset_data_hour_50_3, Group == "IW1" | Group == "IW2"| Group == "IW3")
t.test(Abundance ~ Time, data = subset_data_hour_50_3_MORE,var.equal = TRUE)
subset_data_hour_50_3_MORE <- subset(subset_data_hour_50_3, Group == "SW1" | Group == "SW2"| Group == "SW3")
t.test(Abundance ~ Time, data = subset_data_hour_50_3_MORE,var.equal = TRUE)

subset_data_hours_50_100_K_h_i <- subset(subset_data_k_humilis, exp == "50I" | exp == "100I")
t.test(Abundance ~ Time, data = subset_data_hours_50_100_K_h_i,var.equal = TRUE)
subset_data_hours_50_100_K_h_s <- subset(subset_data_k_humilis, exp == "50S" | exp == "100S")
t.test(Abundance ~ Time, data = subset_data_hours_50_100_K_h_s,var.equal = TRUE)

#CHECK FOR SACCHAROMYCETALES
subset_data_Saccharomycetales <- subset(its_complete_barplots_2, Taxa == "Saccharomycetales" & 
                                  Group %in% c("IW2","IW3","IW4","IW5","SW2","SW3","SW4","SW5"))
exp = rep(c("50I","100I","50S","100S"),each=6)
subset_data_Saccharomycetales <- cbind(subset_data_Saccharomycetales,exp)
subset_data_hours_50_100_S_i <- subset(subset_data_Saccharomycetales, exp == "50I" | exp == "100I")
t.test(Abundance ~ Time, data = subset_data_hours_50_100_S_i,var.equal = TRUE)
subset_data_hours_50_100_S_s <- subset(subset_data_Saccharomycetales, exp == "50S" | exp == "100S")
t.test(Abundance ~ Time, data = subset_data_hours_50_100_S_s,var.equal = TRUE)
