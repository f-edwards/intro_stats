# interactions lab
library(tidyverse)

dat <- read_csv("https://www.openintro.org/data/csv/acs12.csv")
### make a histogram
ggplot(dat, aes(x = income)) +
  geom_histogram()
## check by employment
ggplot(dat, aes(x = income)) +
  geom_histogram() +
  facet_wrap(~employment)

## check by gender
dat |>
  filter(age >= 18) |> # subset to adults
  group_by(gender, employment) |> # group by both
  summarize(n = n()) |> # count
  group_by(gender) |> # compute proportions by gender
  mutate(prop = n / sum(n))

## but let's subset to only workers
dat_employed <- dat |>
  filter(employment == "employed")

## look at the histogram now
ggplot(dat_employed, aes(x = income)) +
  geom_histogram()

## remove zero incomes, do a log transform
dat_employed <- dat_employed |>
  filter(income > 0) |>
  mutate(income_log = log(income))
## log looks good
ggplot(dat_employed, aes(x = income_log)) +
  geom_histogram()

## let's start with a gender model

m0 <- lm(income_log ~ gender, data = dat_employed)
dat_employed |>
  group_by(gender) |>
  summarize(mean_income_log = mean(income_log))

## let's add race
# make white reference
dat_employed <- dat_employed |>
  mutate(
    race = factor(
      race, # relevel white male to be reference
      levels = c("white", "asian", "black", "other")
    ),
    gender = factor(gender, levels = c("male", "female"))
  )


m1 <- lm(income_log ~ -1 + gender + race, data = dat_employed)

m2 <- lm(income_log ~ -1 + gender * race, data = dat_employed)

# visualize your regression -----------------------------------------------
# set up data to visualize the expected values
gender <- unique(dat_employed$gender)
race <- unique(dat_employed$race)
# create all unique combinations
fake_data <- expand_grid(race, gender)
# generate expected values and CI
e_income <- predict(m2, newdata = fake_data, interval = "confidence")
## attach expected values
fake_data <- fake_data |>
  cbind(e_income)
## plot it
ggplot(
  fake_data,
  aes(x = race, y = fit, ymin = lwr, ymax = upr, color = gender)
) +
  geom_pointrange(position = position_dodge(width = 1))

# on the dollar scale
ggplot(
  fake_data,
  aes(x = race, y = exp(fit), ymin = exp(lwr), ymax = exp(upr), color = gender)
) +
  geom_pointrange(position = position_dodge(width = 1))


# fit by gender, race, and age --------------------------------------------

m3 <- lm(income_log ~ gender * race * age, data = dat_employed)

# visualize your regression -----------------------------------------------
# set up data to visualize the expected values
gender <- unique(dat_employed$gender)
race <- unique(dat_employed$race)
age <- 18:65
hrs_work <- 40
# create all unique combinations
fake_data <- expand_grid(race, gender, age, hrs_work)
# generate expected values and CI
e_income <- predict(m3, newdata = fake_data, interval = "confidence")
## attach expected values
fake_data <- fake_data |>
  cbind(e_income)

## plot it
ggplot(
  fake_data,
  aes(x = age, y = fit, ymin = lwr, ymax = upr, color = gender, fill = gender)
) +
  geom_ribbon(alpha = 0.5) +
  geom_line() +
  facet_wrap(~race, nrow = 1)
#
# # on the dollar scale
# ggplot(
#   fake_data,
#   aes(x = race, y = exp(fit), ymin = exp(lwr), ymax = exp(upr), color = gender)
# ) +
#   geom_pointrange(position = position_dodge(width = 1))
