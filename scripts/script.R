library(dplyr)
municipios_beneficiados <- read.csv("../arcgis/populacao_agua_esgoto.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")
dados <- mutate(municipios_beneficiados, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)
write.table(dados, file = "taxas.csv", sep = ",", col.names = T, quote = T)
