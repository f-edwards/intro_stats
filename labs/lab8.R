library(qss)
library(tidyverse)
data(progresa)
## 1 

impact.cct<-progresa %>% 
  group_by(treatment) %>% 
  summarise(mean_pri = mean(pri2000s),
            mean_turn = mean(t2000))

model.turnout<-lm(t2000 ~ treatment, 
                  data = progresa)

model.pri<-lm(pri2000s ~ treatment,
              data = progresa)

## Q 2

model.turnout2<-lm(t2000 ~ treatment +
                     avgpoverty + pobtot1994 +
                     votos1994 + pri1994 + pan1994 + 
                     prd1994, 
                  data = progresa)

model.pri2<-lm(pri2000s ~ treatment +
                     avgpoverty + pobtot1994 +
                     votos1994 + pri1994 + pan1994 + 
                     prd1994,
              data = progresa)

## Visualize our data

table(progresa$treatment)
hist(progresa$avgpoverty)
hist(progresa$pobtot1994)
hist(progresa$votos1994)
hist(progresa$pri1994)
hist(progresa$pan1994)
hist(progresa$prd1994)

ggplot(progresa, aes(x=pobtot1994, y = fitted(m6))) +
  geom_point() + 
  scale_x_log10()

## Question 3

m6<-lm(pri2000s ~ treatment *
         (avgpoverty + I(avgpoverty^2)) +
         log(pobtot1994), 
       data = progresa)