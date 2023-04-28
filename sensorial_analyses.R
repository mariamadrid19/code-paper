#Radar plots using the fmsb package
install.packages("fmsb")
library(fmsb)
cup_scores_1 <- data.frame(
       row.names = c("q_grader_1", "q_grader_2", "q_grader_3"),
       aroma = c(7.75, 7.75, 8),
       taste = c(7.75, 8, 7.75),
       residual_taste = c(7.75, 7.5, 8),
       acidity = c(7.75, 7.75, 8),
       body = c(7.75, 7.75, 8),
       uniformity = c(8, 8, 8),
       balance = c(7.5, 8, 8),
       clean_cup = c(8, 8, 8),
       sweetness = c(8, 8, 10),
       general = c(7.5, 7.75, 7.75))
cup_scores_1

max_min <- data.frame(
  aroma = c(10, 7), taste = c(10, 7), residual_taste = c(10, 7),
  acidity = c(10, 7), body = c(10, 7), uniformity = c(10, 7),
  balance = c(10, 7), clean_cup = c(10, 7), sweetness = c(10, 7),
  general = c(10,7)
)
rownames(max_min) <- c("Max", "Min")
df1 <- rbind(max_min, cup_scores_1)
df1

areas <- c(rgb(1, 0, 0, 0.2),
           rgb(0, 1, 0, 0.2),
           rgb(0, 0, 1, 0.2))
radarchart(df1,
           cglty = 1,       # Grid line type
           cglcol = "gray", # Grid line color
           pcol = 2:4,      # Color for each line
           plwd = 2,        # Width for each line
           plty = 1,        # Line type for each line
           pfcol = areas,   # Color of the areas
           title = "Standard fermentation cupping",
           axistype = 1, axislabcol = "gray5", caxislabels = c("7","7.75","8.5","9.25","10"), calcex = 0.7)

legend("topright",
       legend = paste("Q Grader", 1:3),
       bty = "n", pch = 20, col = areas,
       text.col = "black", pt.cex = 2)

cup_scores_2 <- data.frame(
  row.names = c("q_grader_1", "q_grader_2", "q_grader_3"),
  aroma = c(7.5, 7.75, 7.5),
  taste = c(7.75, 7.75, 7.75),
  residual_taste = c(7.25, 7.5, 7.5),
  acidity = c(7.5, 7.75, 7.75),
  body = c(7.5, 7.75, 8),
  uniformity = c(10, 10, 10),
  balance = c(7.5, 7.75, 7.5),
  clean_cup = c(10, 10, 10),
  sweetness = c(10, 10, 10),
  general = c(7.75, 7.75, 7.75))
cup_scores_2
df2 <- rbind(max_min, cup_scores_2)
df2
radarchart(df2,
           cglty = 1,       # Grid line type
           cglcol = "gray", # Grid line color
           pcol = 2:4,      # Color for each line
           plwd = 2,        # Width for each line
           plty = 1,        # Line type for each line
           pfcol = areas,   # Color of the areas 
           title = "SW fermentation 50h cupping",
           axistype = 1, axislabcol = "gray5", caxislabels = c("7","7.75","8.5","9.25","10"), calcex = 0.7)    
legend("topright",
       legend = paste("Q Grader", 1:3),
       bty = "n", pch = 20, col = areas,
       text.col = "black", pt.cex = 2)

cup_scores_3 <- data.frame(
  row.names = c("q_grader_1", "q_grader_2", "q_grader_3"),
  aroma = c(8, 8, 8.75),
  sabor = c(8, 8, 8.5),
  sabor_residual = c(7.5, 7.5, 8.25),
  acidez = c(8, 7.75, 8.25),
  cuerpo = c(8, 7.75, 8.25),
  uniformidad = c(8, 8, 8),
  balance = c(7.75, 7.75, 8),
  limpieza = c(8, 8, 8),
  dulzura = c(8, 8, 10),
  general = c(7.75, 8, 8.25))
cup_scores_3

df3 <- rbind(max_min, cup_scores_3)
df3
radarchart(df3,
           cglty = 1,       # Grid line type
           cglcol = "gray", # Grid line color
           pcol = 2:4,      # Color for each line
           plwd = 2,        # Width for each line
           plty = 1,        # Line type for each line
           pfcol = areas,   # Color of the areas 
           title = "IW fermentation 50h cupping",
           axistype = 1, axislabcol = "gray5", caxislabels = c("7","7.75","8.5","9.25","10"), calcex = 0.7)    
legend("topright",
       legend = paste("Q Grader", 1:3),
       bty = "n", pch = 20, col = areas,
       text.col = "black", pt.cex = 2)

cup_scores_4 <- data.frame(
  row.names = c("q_grader_1", "q_grader_2", "q_grader_3"),
  aroma = c(8.25, 8.5, 8.5),
  taste = c(8.25, 8.5, 8.5),
  residual_taste = c(8, 8, 8.5),
  acidity = c(8.25, 8.25, 8.75),
  body = c(7.75, 7.75, 8),
  uniformity = c(10, 10, 10),
  balance = c(8.25, 8, 8),
  clean_cup = c(10, 10, 10),
  sweetness = c(10, 10, 10),
  general = c(8.25, 8.25, 8))
cup_scores_4
df4 <- rbind(max_min, cup_scores_4)
df4
radarchart(df4,
           cglty = 1,       # Grid line type
           cglcol = "gray", # Grid line color
           pcol = 2:4,      # Color for each line
           plwd = 2,        # Width for each line
           plty = 1,        # Line type for each line
           pfcol = areas,   # Color of the areas 
           title = "Inoculated fermentation cupping",
           axistype = 1, axislabcol = "gray5", caxislabels = c("7","7.75","8.5","9.25","10"), calcex = 0.7)    
legend("topright",
       legend = paste("Q Grader", 1:3),
       bty = "n", pch = 20, col = areas,
       text.col = "black", pt.cex = 2)
