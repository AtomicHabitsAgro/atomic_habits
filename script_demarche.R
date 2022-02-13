## Démarche scientifique__ Traitement des données 
#
library(tidyverse)
library(ade4)
library(RColorBrewer)
library(ggplot2)
library(factoextra)


#
##
## Traitement des données avec FactorMineR  
##
#
 
reponse_finale <- read.table(file = 'reponse_finale.csv', header = T, sep = ";", stringsAsFactors = T, quote =)




library(FactoMineR)
colnames(reponse_finale)

sub_response <- reponse_finale[,1:10]

res <- MCA(sub_response)



res.dim <- dimdesc(res)
names(res.dim)
res.dim$`Dim 1`

res.hcpc <- HCPC(res)
names(res.hcpc)
res.hcpc$data.clust

names(res.hcpc$desc.var)

names(res.hcpc$desc.var$category)

res.hcpc$desc.var$category$'3'
res.hcpc$desc.var$category$'1'

fviz_cluster(res.hcpc,
             repel = TRUE,            # Avoid label overlapping
             show.clust.cent = F, # Show cluster centers
             palette = "Dark2",         # Color palette see ?ggpubr::ggpar
             ggtheme = theme_minimal(),
             main = "Factor map")


#
##
#

ana_text <- AnalyseText


ana_text

?AovSum

summary(ana_text)
res <- AovSum(Note~ Assertion + Individus , data=ana_text)
res$Ftest
res$Ttest

ana_text$Individus <- as.factor(ana_text$Individus)
ana_text$Assertion <- as.factor(ana_text$Assertion)


save(ana_text, reponse_finale, file = "Analyse_texte.RData")



