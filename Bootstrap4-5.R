B <- 10
set.seed(1)
y <- rnorm(100, 0, 1)
set.seed(1)
indexes <- createResample(y, B)
output <- array()
for(i in 1:B){
  output[i] <- quantile(y[unlist(indexes[i])], 0.75)
}
mean(output)
sd(output)
