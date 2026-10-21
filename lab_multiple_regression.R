library(tidyverse)
# for arranging ggplots
library(patchwork)
# for attaching some geo data
library(maps)

# read in apel's UCR data
ucr <- read.csv(
  "https://raw.githubusercontent.com/bobapel-git/ucr-offenses-by-state-1960-2020/refs/heads/main/ucr-offenses-by-state-1960-2020.csv"
)

## think about homicide
ggplot(ucr, aes(x = homicide)) +
  geom_histogram()

## think about population
ggplot(ucr, aes(x = estimated_population)) +
  geom_histogram()

# think about computing a rate
sum(ucr$homicide, na.rm = T) / sum(ucr$estimated_population, na.rm = T)
# compute rates per 100k
ucr <- ucr |>
  mutate(homicide_per100k = homicide / estimated_population * 1e5)

## visualize the homicide reate
ggplot(ucr, aes(x = homicide_per100k)) +
  geom_histogram()

# setup homicide count and rate together
p1 <- ggplot(ucr, aes(x = homicide)) +
  geom_histogram()
p2 <- ggplot(ucr, aes(x = homicide_per100k)) +
  geom_histogram()

#p1 + p2

## let's check out those missings
table(ucr$state_abbr, is.na(ucr$homicide))

## join census region and division onto ucr
state.fips <- maps::state.fips
state.fips_2 <- state.fips |>
  select(-polyname) |>
  distinct() |>
  rename(state_fips = fips, state_abbr = abb)

# attach this to ucr
ucr_region <- ucr |>
  left_join(state.fips_2)

## estimate a regression for homicide by region
m_region <- lm(homicide_per100k ~ factor(region), data = ucr_region)

m_region_noB0 <- lm(homicide_per100k ~ -1 + factor(region), data = ucr_region)

## let's ask if homicide rates have increased over time
ucr_region |>
  group_by(year) |>
  summarize(
    homicide_per100k = sum(homicide, na.rm = T) /
      sum(estimated_population, na.rm = T) *
      1e5
  ) |>
  ggplot(aes(x = year, y = homicide_per100k)) +
  geom_line() +
  geom_smooth(method = "lm")

## estimate a bad model
m_t0 <- lm(
  homicide_per100k ~ I(year - 1960) +
    factor(region),
  data = ucr_region
)
