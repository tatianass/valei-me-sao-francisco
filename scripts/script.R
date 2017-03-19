library(dplyr) 

#loading data
municipios_esgoto_agua <- read.csv("../arcgis/populacao_agua_esgoto.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")

#creating percentages
m <- mutate(municipios_esgoto_agua, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)

#selecting variables to create json file
m_hist <- m_hist %>% select(id, nome, ano, agua, esgoto, populacao, taxa_esgoto, taxa_agua)

#saving data
write.table(m, file = "taxas.csv", sep = ",", col.names = T, quote = T, fileEncoding = "UTF-8")

#checking data saved
taxas <- read.csv("taxas.csv", header = T, encoding = "UTF-8", stringsAsFactors = F)

