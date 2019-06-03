# Define pasta de trabalho e localiza��o do arquivo dataset
setwd("D:/_dev/Web/www/_mestrado/agrupamento-com-r-studio/Wine")

#carragamento do dataset
Wine = read.csv("wine.data", h = T)
Wine2 = na.omit(Wine)
View(Wine2)

#prepara��o dos dados para clusteriza��o: Atributo alvo = classe. (Atributo � removido do dataset para realizar a clusteriza��o)
Wine2.features = Wine2
Wine2.features$class <- NULL
View(Wine2.features)

#clusteriza��o dos dados utilizando o algoritmo kmeans
results <- kmeans(Wine2.features, 3, iter.max = 10)
results

#visualiza��o das informa��es do clusters resultantes
table(Wine2$class, results$cluster)


#pplotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Wine2.features[], col = results$cluster)

#pplotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Wine2.features[c("Alcohol", "Magnesium")], col = results$cluster)