library(qss)
library(tidyverse)
library(maps)
data(elections)

elections_08<-elections %>% 
  filter(year==2008)

county<-map_data("county")

az_ma_election<-elections_08 %>% 
  filter(state=="massachusetts" | state=="arizona") %>% # filter for only data we need
  rename(region = state, subregion = county) # harmonize the names
  

county_az_ma<-county %>% 
  filter(region=="massachusetts" | region=="arizona")

### confirm that all counties are on both sides for join
length(unique(az_ma_election$subregion))
length(unique(county_az_ma$subregion))

### join the data
az_ma_election<-az_ma_election %>% 
  left_join(county_az_ma)

### confirm the correct structure of the data: should be 1606 rows
### because that's the size of the shape file
nrow(az_ma_election)
nrow(county_az_ma)

### make vote share variable
az_ma_election<-az_ma_election %>% 
  mutate(pct_dem = dem/(rep+dem+other))

### ready to plot
ggplot(az_ma_election, 
       aes(x = long, y = lat)) + 
  geom_polygon()
### well that's a start....
ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group)) + 
  geom_polygon()
### better
#### add our election variable
ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon()

### hard to look at: make one plot for each state
ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  facet_wrap(~region)

### rescale lat/long for each plot
ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  facet_wrap(~region, scales = "free")

### now make R red, Dem blue
### Make 50 percent dem == 0, less than 50 is negative, higher is positive
az_ma_election<-az_ma_election %>% 
  mutate(pct_dem = pct_dem - 0.5)

### use scale_fill_gradient2() to add a two-color diverging gradient

ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  scale_fill_gradient2() +
  facet_wrap(~region, scales = "free")

### make it a little prettier
ggplot(az_ma_election, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  scale_fill_gradient2() +
  facet_wrap(~region, scales = "free") + 
  theme_void()



### question 2

### harmonize names

elections_08<-elections_08 %>%
  rename(region=state,subregion= county)%>%
  mutate(pct_dem=dem/(rep+dem+other)-0.5)%>%
  left_join(county)

ggplot(elections_08, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  scale_fill_gradient2() +
  facet_wrap(~region, scales = "free") + 
  theme_void()


### a start on question 3 - go forth from here

elections<-elections %>%
  rename(region=state,subregion= county)%>%
  mutate(pct_dem=dem/(rep+dem+other)-0.5)%>%
  left_join(county)

ggplot(elections, 
       aes(x = long, y = lat, group = group,
           fill = pct_dem)) + 
  geom_polygon() + 
  scale_fill_gradient2() +
  facet_wrap(~year, scales = "free") + 
  theme_void()


