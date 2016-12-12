data = read.csv("flight100row_new.csv")
newiris <- data
newiris$Species <- NULL
(kc <- kmeans(newiris, 5)) 

table(iris$Species, kc$cluster)

plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)