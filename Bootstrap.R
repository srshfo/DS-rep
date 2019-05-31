set.seed(1995)
indexes <- createResample(mnist_27$train$y, 10)
y <- rnorm(100, 0, 1)
qnorm(0.75)
quantile(y, 0.75)
set.seed(1)
Ms <- replicate(10000, {
  y <- rnorm(100, 0, 1)
  M <- quantile(y, 0.75)
})
mean(Ms)
sd(Ms)
set.seed(1)
y_star <- createResample(y, 10)
output <- matrix(ncol=1, nrow=10)
count <- 1
for(i in y_star){
  output[count,] <- quantile(i, 0.75)
  count <- count +1 
}
q_star <- data.frame(output)
mean(q_star$output)
sd(q_star$output)

# Q75s <- map_dbl(B, function(ind)
# {
#   y_hat <- indexes[,ind]
#   quantile(y_hat, 0.75)
# })
# mean(Q75s)
# sd(Q75s)


