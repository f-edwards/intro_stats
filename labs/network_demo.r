library(qss)
library(tidyverse)
library(igraph)
data(trade)

### remove missings - that's weird

trade_new<-trade_new %>% 
  filter(!(is.na(country1)), !(is.na(country2)))

adj_matrix<-function(x, y){
  ### x is the trade data, filtered for a single year
  ### y is the year we are producing
  temp<-x %>% 
    filter(year==y) %>% 
    select(country1, country2, exports)
  
  ### pivot_wider is the new version for spread
  
  temp_wide<-temp %>% 
    pivot_wider(names_from = country2, 
                values_from = exports)
  
  row.names(temp_wide)<-temp_wide$country1
  
  temp_wide<-temp_wide %>% 
    select(-country1)
  
  temp_wide<-as.matrix(temp_wide)
  
  ### turn NA into zero
  temp_wide[is.na(temp_wide)]<-0

  return(temp_wide)
}


### make a list to store each adjacency matrix
adj_mat_year<-list()
### make a vector with all years for matching
years<-unique(trade_new$year)

for(i in 1:length(unique(years))){
  adj_mat_year[[i]]<-adj_matrix(trade_new, years[i]) ## double brackets to index lists
}

temp1<-graph_from_adjacency_matrix(adj_mat_year[[1]], mode = "directed")

### plot data
p_dat<-data.frame(year = years, density = NA)
for(i in 1:length(years)){
  p_dat$density[i]<-edge_density(graph_from_adjacency_matrix(adj_mat_year[[i]], 
                                                             mode = "directed"))
}

ggplot(p_dat, 
       aes(x=year, y = density)) + 
  geom_line()