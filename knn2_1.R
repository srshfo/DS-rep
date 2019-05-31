library(dslabs)
data("tissue_gene_expression")
set.seed(1)
x <- tissue_gene_expression$x
y <- tissue_gene_expression$y
test_index <- createDataPartition(y, times = 1, list = FALSE)
x.train <- x[test_index, ]
x.test <- x[-test_index, ]
y.train <- y[test_index]
y.test <- y[-test_index]
ks <- c(1, 3, 5, 7, 9, 11)
accuracy <- map_df(ks, function(k) {
    set.seed(1)
    knn_fit <- knn3(x.train, y.train, k = k) 
    y_hat <- predict(knn_fit, x.test, type = "class") 
    test_error <- confusionMatrix(data = y_hat,reference = y.test,mode = "everything")$overall["Accuracy"] 
    list(k = k, test = test_error)
  })
