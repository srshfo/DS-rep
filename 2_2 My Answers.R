library(dslabs)
library(dplyr)
library(lubridate)
library(caret)
data(iris)
iris <- iris[-which(iris$Species=='setosa'),]
y <- factor(iris$Species)
x <- iris$Petal.Width
set.seed(2)
test_index<-createDataPartition(y,times = 1,p=0.5,list=FALSE)
test <- iris[test_index,]
train <- iris[-test_index,]
cutoff_l<- 0.96
cutoff_w<- 0.94
accuracy<-map_dbl(cutoff_l,function(xx){
  y_hat<-ifelse((test$Petal.Length > 4.7 | test$Petal.Width > 1.5),"virginica","versicolor") %>% factor(levels=levels(test$Species))
  mean(y_hat==test$Species)
})
accuracy
# plot(accuracy)
# foo <- function(x){
#   rangedValues <- seq(range(x)[1],range(x)[2],by=0.1)
#   sapply(rangedValues,function(i){
#     y_hat <- ifelse(x>i,'virginica','versicolor')
#     mean(y_hat==test$Species)
#   })
# }
# predictions <- apply(test[,-5],2,foo)
# sapply(predictions,max)
