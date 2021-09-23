#---------------------------------------------------------------------------------------------------------------------------------------
# Workspace preparation
#---------------------------------------------------------------------------------------------------------------------------------------

# Import Libraries
library(GPArotation)
library(corrplot)
library(corrgram)
library(readr)
library(ggplot2)
library(tidyverse)

#---------------------------------------------------------------------------------------------------------------------------------------
# Data Import
#---------------------------------------------------------------------------------------------------------------------------------------

# Load Data
raw_credit_card <- read_csv("credit_card.csv")

#---------------------------------------------------------------------------------------------------------------------------------------
# Aufgabe 1  - Data Understanding
#---------------------------------------------------------------------------------------------------------------------------------------

# Verständnis für die Attribute 
View(raw_credit_card)
str(raw_credit_card)
summary(raw_credit_card)

# relativer Anteil an NA's 
sum(is.na(raw_credit_card))/nrow(raw_credit_card)

#---------------------------------------------------------------------------------------------------------------------------------------
# Aufgabe 2 - Data Distribution
#---------------------------------------------------------------------------------------------------------------------------------------

# korrelationsmatrix
corrgram(raw_credit_card)

# verteilung für jedes feature 
raw_credit_card %>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram()

#---------------------------------------------------------------------------------------------------------------------------------------
# Aufgabe 3 - Data Manipulation 
#---------------------------------------------------------------------------------------------------------------------------------------

# drop NA's  
clean_num <- na.omit(raw_credit_card)

# drop CUSTID var
clean_num$CUST_ID <- NULL

# drop TENURE var 
clean_num$TENURE <- NULL 

#---------------------------------------------------------------------------------------------------------------------------------------
# Aufgabe 4 - PCA & Factor Analysis
#---------------------------------------------------------------------------------------------------------------------------------------

## PCA - maximale Varianz auf minimale Hauptkomponenten konzentrieren 

# principal component analysis - scale. normiert die daten
pca <- prcomp(x = clean_num, center = TRUE, scale. = TRUE)

# aus 10 Merkmalen die stark miteinander korrilieren, haben wir 10 Hauptkomponenten erstellt die keine Korrelation zueinander aufweisen
round(cor(pca$x), 2)

# erklärungsgehalt der varianz der einzelnen Hauptkomponenten - visual approach: elbow method 
screeplot(pca)

# möglichst nah an 1 oder -1, dann erklaert diese Hauptkomponente die Varianz des Features besonders gut 
round(pca$rotation, 2)

# wie viel Prozent der Varianz erklären eigentlich die einzelnen Merkmale --> Ziel: >= 80 % 
t <- round(pca$sdev^2/ sum(pca$sdev^2), 5)

# summe der beschreibenden Varianz der ersten 8 Hauptkomponenten
sum(t[1:5])

#---------------------------------------------------------------------------------------------------------------------------------------

## Factor Analysis - Ergebnisse der PCA, als Orientierungsmaß für die Anzahl der Faktoren
## Die Anforderung sind entsprechend der Präsentation zu entnehmen

# try and error mit verschiedenen factor anzahlen (5,6,7,8) und keiner rotationsmethode 
fa <- factanal(scale(clean_num), factors = 6, rotation = "none", scores = "regression")
fa

# Visualisierung 
biplot(x = fa$scores[1:10, 1:2], y = fa$loadings[,1:2])

# try and error mit verschiedenen factor anzahlen (5,6,7,8) und der rotationsmethode promax
fa_promax <- factanal(scale(clean_num), factors = 6, rotation = "promax", scores = "regression")
fa_promax

# Visualisierung
biplot(x = fa_promax$scores[1:10, 1:2], y = fa_promax$loadings[,1:2])

# try and error mit verschiedenen factor anzahlen (5,6,7,8) und der rotationsmethode varimax
fa_varimax <- factanal(scale(clean_num), factors = 6, rotation = "varimax", scores = "regression")
fa_varimax

# Visualisierung
biplot(x = fa_varimax$scores[1:10, 1:2], y = fa_varimax$loadings[,1:2])

# try and error mit verschiedenen factor anzahlen (5,6,7,8) und der rotationsmethode quartimax
fa_quartimax <- factanal(scale(clean_num), factors = 6, rotation = "quartimax", scores = "regression")
fa_quartimax

# Visualisierung
biplot(x = fa_quartimax$scores[1:10, 1:2], y = fa_quartimax$loadings[,1:2])



