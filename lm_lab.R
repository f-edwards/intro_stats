crimrec <- read.csv("./data/criminalrecord.csv")

crimrec <- read.csv(
  "https://raw.githubusercontent.com/f-edwards/intro_stats/refs/heads/master/data/criminalrecord.csv"
)

table(crimrec$callback, crimrec$black)
library(tidyverse)
# do a simple crosstab
crimrec |>
  group_by(black, callback) |>
  count()
### add a mutate to compute proportion
crimrec |>
  group_by(black, callback) |>
  summarize(n = n()) |>
  mutate(p = n / sum(n))

## estimate a simple linear regression
m0 <- lm(callback ~ black, data = crimrec)

## switch over to crimrec
crimrec |>
  group_by(crimrec, callback) |>
  summarize(n = n()) |>
  mutate(p = n / sum(n))

m1 <- lm(callback ~ crimrec, data = crimrec)

## using iris
library(palmerpenguins)

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram()

ggplot(penguins, aes(x = flipper_length_mm)) +
  geom_histogram()

ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  geom_abline()


p0 <- lm(flipper_length_mm ~ body_mass_g, data = penguins)

betas <- coef(p0)

ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  geom_abline(aes(intercept = betas[1], slope = betas[2])) +
  coord_cartesian(xlim = c(0, 7000), ylim = c(0, 235))

penguins <- penguins |>
  mutate(flipper_z = scale(flipper_length_mm), mass_z = scale(body_mass_g))

p1 <- lm(flipper_z ~ mass_z, data = penguins)

betas <- coef(p1)


ggplot(penguins, aes(x = mass_z, y = flipper_z)) +
  geom_point() +
  geom_smooth(method = "lm")


ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram()
ggplot(penguins, aes(x = scale(body_mass_g))) +
  geom_histogram()
