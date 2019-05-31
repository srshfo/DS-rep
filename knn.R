library(tidyverse)
library(dslabs)
data("heights")
x <- heights$height
y <- heights$sex
set.seed(1)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
train <- heights[-test_index,]
test <- heights[test_index,]
#set.seed(2, sample.kind = "Rounding")
ks <- seq(1, 101, 3)
F_1 <- sapply(ks, function(k){
  fit <- knn3(sex ~ height, data = train, k = k)
  y_hat <- predict(fit, test, type = "class") %>% factor(levels = levels(train$sex))
  fm <- F_meas(data = y_hat, reference = test$sex)
  max(fm)
})
