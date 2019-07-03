library(readstata13)
library(dplyr)
library(reshape)
library(reshape2)
library(purrr)
library(tidyverse)
library(BBmisc)


getwd()

##Getting the FAS DataSet
FASDataset<-read.dta13("R:/DOC/FI/FAS/FAST/Data/Clean/Latest Complete File for Analysis/CompleteLatestFAS_022719.dta")
colnames(FASDataset)

##Distribution of FAS country reporters according to income groups
Distributionofincomegroups<-
  FASDataset%>%
  filter(!is.na(group_income))%>%
  group_by(group_income)%>%
    summarise(Numofcountries=n_distinct(economy))
View(Distributionofincomegroups)

View(FASDataset[which(FASDataset$group_region==""),])
##Two countries Monsterrat and Anguilla do not have income classification.


##Distribution of FAS country reporters according to regional groups
Distributionofregionalgroups<-
  FASDataset%>%
  filter(!is.na(group_region))%>%
  group_by(group_region)%>%
  summarise(Numofcountries=n_distinct(economy))
View(Distributionofregionalgroups)

##Distribution of FAS country reporters according to IMF groups
DistributionofIMFgroups<-
  FASDataset%>%
  filter(!is.na(group_IMF))%>%
  group_by(group_IMF)%>%
  summarise(Numofcountries=n_distinct(economy))
View(DistributionofIMFgroups)

