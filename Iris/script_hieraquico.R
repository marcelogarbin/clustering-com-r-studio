# Define pasta de trabalho e localiza��o do arquivo dataset
setwd("D:/_dev/Web/www/_mestrado/agrupamento-com-r-studio/Iris")

# Carragamento do dataset, informa que o dataset possui cabe�alho
Iris = read.csv("iris_data.csv", header = T)

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

# � constru�da a matriz de distancias entre cada elemento da base de dados Iris2.features
d <- dist(Iris2.features)
# � aplicado o algoritmo de clusteriza��o hier�rquica na matriz de dist�ncias d utilizando o m�todo "single".
# Pode-se utilizar outros m�todos como "complete" e "average".
results <- hclust(d, "single")

# Plotagem do dendograma originado pelos resultados (results).
plot(results)

# Realiza um recorte no dendograma originado de results, separando o dendograma em k grupos (k = 4).
# A tag border define a cor dos ret�ngulos que realizam o recorte.
rect.hclust(results, k = 4, border = "red")
clusters <- cutree(results, 4)

# Gera uma estrutura que indica a qual cluster pertence cada elemento da base de dados, 
# referenciando pelo �ndice da estrutura.
clusters

# Plotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Iris2[], col = clusters)

# Plotagem do resultados: neste exemplo (petal.length x petal.width)
plot(Iris2[c("petal.length", "petal.width")], col = clusters)