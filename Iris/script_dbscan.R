# Define pasta de trabalho e localiza��o do arquivo dataset
setwd("D:/_dev/Web/www/_mestrado/agrupamento-com-r-studio/Iris")

# Instala pacotes
#install.packages("fpc")
#install.packages("dbscan")
# Chama pacotes
library(fpc)
library(dbscan)

# Carragamento do dataset, informa que o dataset possui cabe�alho
Iris = read.csv("iris_data.csv", header = TRUE)

# � realizada c�pia do dataset em uma nova vari�vel 
# omitindo poss�veis erros de dados (ausencia de valores, not-a-number, etc..)
Iris2 = na.omit(Iris)

# � chamada a visualiza��o do dataset
View(Iris2)

# Prepara��o dos dados para clusteriza��o: Atributo alvo = classe. 
# (Atributo � removido do dataset para realizar a clusteriza��o)
Iris2.features = Iris2
Iris2.features$class <- NULL
View(Iris2.features)

# Calcular e tra�ar a dist�ncia vizinha mais pr�xima de k
# O gr�fico pode ser usado para ajudar a encontrar um valor adequado para a vizinhan�a do eps
kNNdistplot(Iris2.features, k = 3)

results <- dbscan(Iris2.features, eps = 0.6, minPts = 4)

results

# Plotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Iris2[], col = results$cluster)

# Plotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Iris2[c("sepal.length", "sepal.width")], col = results$cluster)
