set.seed(1)
n <- 100
Sigma <- 9 * matrix(c(1.0, 0.95, 0.95, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))
test_index <-
  createDataPartition(dat$y,
                      times = 1,
                      p = 0.5,
                      list = FALSE)
train_set <- dat %>% slice(-test_index)
test_set <- dat %>% slice(test_index)
fit <- lm(y ~ x, data = train_set)
y_hat <- predict(fit, newdata = test_set)

sqrt(mean((y_hat - test_set$y) ^ 2))
sqrt(sd((y_hat - test_set$y)^ 2))
