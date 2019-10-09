### 3.9.1

library(qss)
library(tidyverse)

data("gayreshaped")
data("ccap2012")

s1<-gayreshaped %>% 
  filter(study==1,
         treatment == "No Contact") 

cor(s1$therm1, s1$therm2,
    use = "complete")

ggplot(s1, 
       aes(x = therm1,
           y = therm2)) +
  geom_point()

s2<-gayreshaped %>% 
  filter(study==2,
         treatment == "No Contact") 

cor(s2$therm1, s2$therm2,
    use = "complete")

ggplot(s2, 
       aes(x = therm1,
           y = therm2)) +
  geom_point()