#### MAPSSSSSSSS

library(qss)
library(tidyverse)
library(maps)

county<-map_data("county")
state<-map_data("state")


### MAKE A COUNTY MAP
ggplot(county,
       aes(x = long, 
           y = lat, 
           group=group)) + 
  geom_polygon(fill = "white",
               color = "grey50") + 
  theme_void()

### subset to a single state

ggplot(county %>% 
         filter(region=="alabama"),
       aes(x = long, 
           y = lat, 
           group=group)) + 
  geom_polygon(fill = "white",
               color = "grey50") + 
  theme_void()

### subset to a group of states

includes<-c("arizona", "massachusetts",
            "nebraska")

ggplot(county %>% 
         filter(region%in%includes),
       aes(x = long, 
           y = lat, 
           group=group)) + 
  geom_polygon(fill = "white",
               color = "grey50") + 
  theme_void()

### facet by state

ggplot(county %>% 
         filter(region%in%includes),
       aes(x = long, 
           y = lat, 
           group=group)) + 
  geom_polygon(fill = "white",
               color = "grey50") + 
  facet_wrap(~region, ncol=1,
             scales = "free") + 
  theme_void()

### add election data
data(elections)
## create meaningful vote share variables
### join elections onto county
### vote variables as fills
### facet by year

##### join elections and map
head(elections)
head(county)

### harmonize the keys
elections<-elections %>% 
  rename(region = state,
         subregion = county)

county_elections<-county %>% 
  left_join(elections)

########### TEXT ANALYSIS

library(tm)
library(SnowballC)
data(constitution)

### SET UP 

corpus.raw<-Corpus(
  VectorSource(
    constitution$preamble))

### clean text
corpus.raw<-tm_map(corpus.raw, 
                   content_transformer(tolower))

corpus.raw<-tm_map(corpus.raw, 
                   removePunctuation)

corpus.raw<-tm_map(corpus.raw, 
                   removeNumbers)

corpus.raw<-tm_map(corpus.raw, 
                   stripWhitespace)

### to check that the documents
### look ok
substr(content(corpus.raw),1,30)

corpus<-tm_map(corpus.raw, 
               removeWords,
               stopwords("en"))

corpus<-tm_map(corpus,
               stemDocument)

#### check it
content(corpus[[1]])

### create stem matrix
dtm<-DocumentTermMatrix(corpus)

dtm.tfidf<-weightTfIdf(dtm)

### formula for question 2

### formula for length a
tfidf.mat<-as.matrix(dtm.tfidf)

### loop our length function over every row

rows<-nrow(tfidf.mat)
cols<-ncol(tfidf.mat)

length_a<-function(x){
  a<-sqrt(sum(x^2))
  return(x/a)
}

for(i in 1:rows){
  tfidf.mat[i,]<-length_a(tfidf.mat[i,])
}

### cosine similarity
### following equation on qss 237

cosine<-function(a,b){
  numer<-apply(a*t(b), 2, sum)
  denom<-sqrt(sum(a^2)) * sqrt(apply(b^2), 1, sum)
  return(numer/denom)
}

### then loop over all rows with US 
### preamble as b (I think it should be b)