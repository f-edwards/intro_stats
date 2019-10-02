rm(list=ls())
library(qss)
library(tidyverse)

data(STAR)
star<-STAR

##############################
### *univariate visuals*
##############################

### for catgegoricals

star <- star %>% 
  mutate(race = 
           case_when(
             race==1~"white",
             race==2~"black",
             race==3~"api",
             race==4~"latinx",
             race==5~"aian",
             race==6~"other",
             is.na(race) ~ "missing"
           ))

ggplot(star,
       aes(x = race)) + 
  geom_bar()

table(star$race)

#### classtype

star<-star %>% 
  mutate(classtype = 
           case_when(
             classtype==1 ~ "small",
             classtype==2 ~ "regular",
             classtype==3 ~ "regular with aid",
             is.na(classtype) ~ "missing"
           ))

table(star$classtype)

ggplot(star,
       aes(x = classtype)) + 
  geom_bar()

### CONTINUOUS

table(star$yearssmall)
hist(star$yearssmall)
ggplot(star,
       aes(x = yearssmall)) + 
  geom_bar()

### HS GRAD

ggplot(star,
       aes(x = hsgrad)) + 
         geom_histogram()

table(star$hsgrad)

### G4math

ggplot(star,
       aes(y = g4math)) + 
  geom_boxplot()

ggplot(star,
       aes(x = g4math)) + 
  geom_histogram()

ggplot(star,
       aes(y = g4math,
           x = as.character(yearssmall))) +
  geom_boxplot() +
  xlab("Years in small class") +
  ylab("math scores") +
  ggtitle("my cool graph") 

ggplot(star,
       aes(x = g4math)) + 
  geom_histogram() + 
  facet_wrap(~yearssmall)

### BIVARIATES, two categoricals

table(star$race, star$classtype)

ggplot(star,
       aes(x = race, 
           fill = classtype)) + 
  geom_bar(position = position_dodge(),
           color = "black") +
  coord_flip()

### BIVARIATES TWO CONTINOUS

ggplot(star,
       aes(x = g4math,
           y = g4reading)) + 
  geom_point()

# ggplot(star,
#        aes(x = g4math,
#            y = g4reading,
#            shape = race,
#            color = yearssmall)) + 
#   geom_point() + 
#   geom_vline(xintercept = 
#                mean(star$g4math,na.rm=TRUE),
#              lty =2) + 
#   geom_hline(yintercept = 
#                mean(star$g4reading,na.rm=TRUE),
#              lty =2)

### 

ggplot(star,
       aes(x = g4math,
           y = g4reading)) + 
  geom_point() + 
  facet_wrap(~yearssmall)

