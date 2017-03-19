library(dplyr)
library(?jsonlite) 

#loading data
municipios_esgoto_agua <- read.csv("../arcgis/populacao_agua_esgoto.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")
municipios_esgoto_agua_hist <- read.csv("../arcgis/populacao_agua_esgoto_hist.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")

#creating percentages
m <- mutate(municipios_esgoto_agua, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)
m_hist <- mutate(municipios_esgoto_agua_hist, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)

#selecting variables to create json file
m_hist <- m_hist %>% select(id, nome, ano, agua, esgoto, populacao, taxa_esgoto, taxa_agua)

# transform the data.frame into the described structure
idsIndexes <- which(names(m_hist) != 'id' & names(m_hist) != 'nome')
a <- lapply(1:nrow(m_hist),FUN=function(i){ 
  list(municipio=list(id=m_hist[i,'id'], nome=m_hist[i, 'nome']),
       valores=lapply(idsIndexes,
                      FUN=function(j)list(ano=m_hist[i,'ano'], agua=m_hist[i,'agua'], esgoto=m_hist[i,'esgoto'], populacao=m_hist[i,'populacao'], taxa_agua=m_hist[i,'taxa_agua'], taxa_esgoto=m_hist[i,'taxa_esgoto'])))
})

# serialize to json
txt <- toJSON(a)
# if you want, indent the json
txt <- prettify(txt)
write(txt, "municipios_hist.json")

#saving data
write.table(m, file = "taxas.csv", sep = ",", col.names = T, quote = T, fileEncoding = "UTF-8")

#checking data saved
taxas <- read.csv("taxas.csv", header = T, encoding = "UTF-8", stringsAsFactors = F)

