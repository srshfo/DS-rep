library(matrixStats)
x <- matrix(rnorm(100*10), 100, 10)
dim(x)[1]
rowSums(x)
col1 <- colSums(x)
col2 <- sweep(x, 2, 1:ncol(x),"+")
col3 <- x + seq(nrow(x))
