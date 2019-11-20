library(tidyverse)
library(qss)

data(pres08)

n<-1000
sims<-1000

pres08<-pres08 %>% 
  mutate(p = Obama / (Obama + McCain))

states<-unique(pres08$state.name)

#### algorithm
### For each state, 
### 1. sample 1000 election results from binomial(n=1000, p=p)
### 2. Call it a success/failure for Obama based on x_i>500
### 3. For successes, give O the electoral votes
### 4. Store results in election_results

election_results<-matrix(data = 0, nrow=1000, ncol=51)

for(s in 1:length(states)){
  temp<-pres08 %>% 
    filter(state.name==states[s])
  ## step 1
  election_replications<-rbinom(sims, size = n, prob = temp$p)
  ## step 2
  success<-election_replications>500
  ## step 3
  ev<-success * temp$EV
  election_results[,s]<-ev
}

results<-rowSums(election_results)

### getting started on homework

data(russia2011)

### question 1
russia2011<-russia2011 %>% 
  mutate(p = votes/turnout)

num_fracs<-length(unique(russia2011$p))

hist(russia2011$p, breaks = num_fracs)

### question 2
### define parameters
sims<-1000
nprecincts<-nrow(russia2011)

## define probabilities for turnout, for UR vote
russia2011<-russia2011 %>% 
  mutate(p_votedUR = votes/turnout,
         p_voted = turnout/N)

### output bucket
output<-matrix(data=0, ncol=sims, nrow=nrow(russia2011))
### MC simulator
for(i in 1:sims){
  turnout<-rbinom(nprecincts, 
                  size=russia2011$N, 
                  p = russia2011$p_voted)
  
  voting<-rbinom(nprecincts,
                 size = turnout,
                 p = russia2011$p_votedUR)
  
  output[,i]<-voting/turnout
}

### count common fractions
n_fracs<-length(unique(output))
### check output for common fractions
table(output==0.5)