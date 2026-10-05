library(tidyverse)
# a seed guarantees the same results every time when simulating
set.seed(10052026)

b0 <- 0.05
b1 <- 0.95

# row 1
b0 + b1 * -0.311
# row 2
b0 + b1 * .932

### simulate some fake data from our regression line
n_sim <- 10

x <- rnorm(n = n_sim, mean = 0, sd = 1)

y_hat <- b0 + b1 * x
y_obs <- rnorm(n = n_sim, mean = y_hat, sd = 1)


my_cool_data_frame <- data.frame(x = x, y_hat = y_hat, y_obs = y_obs)

# compute epsilon
my_cool_data_frame <- my_cool_data_frame |>
  mutate(epsilon = y_obs - y_hat)

plot(x, y_hat)
lines(x, y_hat)

y_obs <- rnorm(n = n_sim, mean = y_hat, sd = 1)

plot(x, y_obs)
lines(x, y_hat)
# estimate a linear regression model
m1 <- lm(Sepal.Length ~ Petal.Length, data = iris)



