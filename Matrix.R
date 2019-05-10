library(tidyverse)
library(dslabs)
library(matrixStats)
if(!exists("mnist")) mnist <- read_mnist()
class(mnist$train$images)
x <- mnist$train$images[1:1000,]
y <- mnist$train$labels[1:1000]
grid <- matrix(x[3,], 28, 28)
image(1:28, 1:28, grid)
image(1:28, 1:28, grid[, 28:1])
#---------------------------------------
new_x <- x[x<50 | x>205] <- 0
new_x <- x[x>=50 & x<=205] <- 1
sums <- rowSums(new_x)
avg <- rowMeans(new_x)
data_frame(labels = as.factor(y), row_averages = avg) %>%
  qplot(labels, row_averages, data = ., geom = "boxplot")
#---------------------------------------
sds <- colSds(x)
qplot(sds, bins = "30", color = I("black"))
image(1:28, 1:28, matrix(sds, 28, 28)[, 28:1])
new_x <- x[ ,colSds(x) > 60]
dim(new_x)

y <- rowMeans(mnist$train$images>50 & mnist$train$images<205)
qplot(as.factor(mnist$train$labels), y, geom = "boxplot")
