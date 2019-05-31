library(devtools)
library(dbplyr)
devtools::install_bioc("genefilter")
library(genefilter)
set.seed(1996)
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()
x_subset <- x[ ,sample(p, 100)]
fit <- train(x_subset, y, method = "glm")
fit$results
tt <- colttests(x, y)
ind <- which(tt$p.value <= 0.01)
x_subset <- x[ ,ind]
fit <- train(x_subset, y, method = "glm")
fit$results
k = seq(101, 301, 25)

fit <- train(x_subset, y, method = "knn", tuneGrid = data.frame(k = seq(101, 301, 25)))
ggplot(fit)

