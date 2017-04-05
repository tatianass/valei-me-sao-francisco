library(ggplot2)

data <- read.csv("~/Downloads/AguaEsgotoHabitantesConsolidadosHistorico.csv", sep = ";", fileEncoding = "latin1", stringsAsFactors = F)
names(data) <- c("codigo", "municipio", "estado", "ano", "prestadores", "servicos", "populacao", "agua", "esgoto")

beneficiados <- read.csv("~/workspace/valei-me-sao-francisco/arcgis/municipios_beneficiados.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ",")
names(beneficiados) <- c("id", "nome", "uf", "pib", "estado", "codigoIBG", "codigo", "ano", "prestadores", "servicos", "populacao", "agua", "esgoto")


# AGUA
dataAguaNotNA <- data[,c("codigo", "ano", "populacao", "agua")]
dataAguaNotNA <- filter(dataAguaNotNA, !is.na(agua))
dataAguaNotNA$codigo <- as.numeric(dataAguaNotNA$codigo)

beneficiadosAguaNotNA <- beneficiados[,c("codigo")]

dataAguaNotNA <- filter(dataAguaNotNA, codigo %in% beneficiadosAguaNotNA)
dataAguaNotNA$aguaPercentual <- dataAguaNotNA$agua / dataAguaNotNA$populacao

sum5perc <- function(data) {
  sum00 <- sum(data < 0.05)
  sum05 <- sum(data >= 0.05 & data < 0.1)
  sum10 <- sum(data >= 0.1 & data < 0.15)
  sum15 <- sum(data >= 0.15 & data < 0.2)
  sum20 <- sum(data >= 0.2 & data < 0.25)
  sum25 <- sum(data >= 0.25 & data < 0.3)
  sum30 <- sum(data >= 0.3 & data < 0.35)
  sum35 <- sum(data >= 0.35 & data < 0.4)
  sum40 <- sum(data >= 0.4 & data < 0.45)
  sum45 <- sum(data >= 0.45 & data < 0.5)
  sum50 <- sum(data >= 0.5 & data < 0.55)
  sum55 <- sum(data >= 0.55 & data < 0.6)
  sum60 <- sum(data >= 0.6 & data < 0.65)
  sum65 <- sum(data >= 0.65 & data < 0.7)
  sum70 <- sum(data >= 0.7 & data < 0.75)
  sum75 <- sum(data >= 0.75 & data < 0.8)
  sum80 <- sum(data >= 0.8 & data < 0.85)
  sum85 <- sum(data >= 0.85 & data < 0.9)
  sum90 <- sum(data >= 0.9 & data < 0.95)
  sum95 <- sum(data >= 0.95)
  total <- sum(data >= 0)
  return(  print(paste(c('',c(sum00,sum05,sum10,sum15,sum20,sum25,sum30,sum35,sum40,sum45,sum50,sum55,sum60,sum65,sum70,sum75,sum80,sum85,sum90,sum95, total)),collapse=",")))
}
aggregate(dataAguaNotNA$aguaPercentual, by=list(dataAguaNotNA$ano), FUN = sum5perc)
