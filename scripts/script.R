#install.packages("dplyr", dependencies = T)
#install.packages("assertthat", dependencies = T)
install.packages("sqldf", dependencies = T)
library(dplyr)
library(sqldf)

#lê csv's
esgoto <- read.csv("../dados/info_esgoto.csv", header = T, sep = ",", encoding = "UTF-8", stringsAsFactors = F)
municipios <- read.csv("../dados/municipios_favorecidos_sao_francisco.csv", header = T, sep = ";", encoding = "UTF-8", stringsAsFactors = F)
municipio_esgoto <- left_join(municipios, esgoto, by = c("MUNICIPIO" = "municipio"))
municipio_esgoto <- sqldf("SELECT * FROM municipios INNER JOIN esgoto ON municipios.MUNICIPIO = esgoto.municipio ")

esgoto <- filter("Ano.de.Referência" == 2015)
