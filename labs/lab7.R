library(qss)
library(tidyverse)

dat<-read_csv("./slides/data/criminalrecord.csv")

### return to the Pager data

### outcome y is callback
### focal predictors: crimrec, black
### other predictors: city, distance, 
### custserv, manualskill

### let's estimate a model:
### callback ~ crimrec

m0<-lm(callback ~ crimrec, 
       data = dat)

m1<-lm(callback ~ crimrec + black,
       data = dat)

m2<-lm(callback ~ crimrec * black ,
       data = dat)

m3<-lm(callback ~ crimrec * black + 
         distance + custserv, data = dat)

### Discuss m2

## use the predict function to describe 
## outcomes across interesting counterfactuals

## what are the interesting cases
## white, no criminal record
## white criminal record
## black no crim
## black crim

sim_dat<-data.frame(black = c(0,0,1,1),
                    crimrec = c(0,1,0,1))

sim_dat<-sim_dat %>% 
  mutate(yhat = 
           predict(m2, newdata = sim_dat))

sim_dat<-sim_dat %>% 
  mutate(black = ifelse(black==1, "Black",
                        "White"),
         crimrec = ifelse(crimrec==1,
                          "crimrec",
                          "no crimrec"))

ggplot(sim_dat,
       aes(x = factor(black), 
           y = yhat)) + 
  geom_col() + 
  facet_wrap(~crimrec)