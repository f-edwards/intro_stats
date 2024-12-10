library(tidyverse)

dat<-read_csv("./data/usa_00084.csv")


### visualize income

### handle missings
# income
dat<-dat %>% 
  mutate(INCTOT = case_when(
    INCTOT == 9999999 ~ NA,
    INCTOT == 9999998 ~ NA,
    T ~ INCTOT
  ))
# age
dat<-dat %>% 
  mutate(AGE = 
           ifelse(AGE == 999,
                  NA,
                  AGE))
# education
dat<-dat %>% 
  mutate(EDUCD = 
           case_when(
             EDUCD == 0 ~ NA,
             EDUCD == 1 ~ NA,
             EDUCD == 999 ~ NA,
             EDUCD <= 64 ~ "HS or lower",
             EDUCD < 114 ~ "College",
             T ~ "Graduate"
           ))


ggplot(dat,
       aes(x = INCTOT)) + 
  geom_histogram()

## estimate a model

m1<-lm(INCTOT~ EDUCD + AGE,
       data = dat)


