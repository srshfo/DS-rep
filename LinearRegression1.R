library(HistData)
library(dslabs)
library(caret)
data("GaltonFamilies")
set.seed(1)
galton_heigths <- GaltonFamilies %>%
  filter(childNum == 1 && gender == 'male') %>%
  select(father,childHeight) %>%
  rename(son=childHeight)
y <- galton_heigths$son
test_index <- createDataPartition(y,times=1,p=0.5,list=FALSE)
train_set <- galton_heigths %>% slice(-test_index)
test_set <- galton_heigths %>% slice(test_index)
#**********Guessing**************
avg <- mean(train_set$son)
avg
mean((avg-test_set$son)^2)
#**********Linear Regression**************
fit <- lm(son ~ father,data = train_set)
fit$coef
y_hat <- fit$coef[1]+fit$coef[2]*test_set$father
mean((y_hat-test_set$son)^2)
#**********Predict**************
y_hat <- predict(fit,test_set)
mean((y_hat-test_set$son)^2)

