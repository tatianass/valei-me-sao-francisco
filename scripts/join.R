library(dplyr) 
library(jsonlite)

#loading data
mun <- read.csv("../arcgis/AguaEsgotoHabitantesConsolidadosHistorico.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")
beneficiados <- read.csv("../arcgis/municipios_beneficiados.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ",")

#joing by city's name
join <- left_join(beneficiados, mun, by = c("nome" = "municipio"))

#selecting desired columns
join <- join %>% select(FID, nome, populacao.x, agua.x, esgoto.x, ano.y)

#renaming columns
names <- c("id", "nome", "populacao", "agua", "esgoto", "ano")
colnames(join) <- names

#creating percentage
m_hist <- mutate(join, taxa_esgoto = esgoto/populacao, taxa_agua = agua/populacao)

#write.table(join, file = "municipios_hist.csv", sep = ",", col.names = T, quote = T, fileEncoding = "UTF-8")

# transform the data.frame into the described structure
#idsIndexes <- which(names(m_hist) != 'id' & names(m_hist) != 'nome')
idsIndexes <- c(1)
a <- lapply(1:nrow(m_hist),FUN=function(i){ 
  list(municipio=list(id=m_hist[i,'id'], nome=m_hist[i, 'nome']),
       valores=lapply(idsIndexes,
                      FUN=function(j)list(populacao=m_hist[i,'populacao'], agua=m_hist[i,'m_hist'], esgoto=m_hist[i,'esgoto'],  ano=m_hist[i,'ano'], taxa_esgoto=m_hist[i,'taxa_esgoto'], taxa_agua=m_hist[i,'taxa_agua'])))
})

# serialize to json
txt <- toJSON(a)
# if you want, indent the json
txt <- prettify(txt)
write(txt, "municipios_hist.json")