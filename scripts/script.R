library(dplyr)
dados <- read.csv("../arcgis/municipios_beneficiados.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ",")
dados <- mutate(dados, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)
write.table(dados, file = "taxas.csv", sep = ",", col.names = T, fileEncoding = "UTF-8", quote = F)
