install.packages("car")

library(car)
dados <- read.csv("../arcgis/populacao_agua_esgoto.csv", header = T, encoding = "UTF-8", stringsAsFactors = F, sep = ";")

scatterplot(mpg ~ wt | cyl, data=mtcars, 
            xlab="Weight of Car", ylab="Miles Per Gallon", 
            main="Enhanced Scatter Plot", 
            labels=row.names(mtcars))
