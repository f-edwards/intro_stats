dat <- read_csv("./data/criminalrecord.csv")


### think about a regression model for this
## the effect of crimrec on callback
# what is the expected rate of callback for crimrec vs no crimrec

m0 <- lm(callback ~ crimrec, data = dat)

m1 <- lm(callback ~ black, data = dat)
# with interaction
m2 <- lm(callback ~ crimrec * black, data = dat)
# and without
m3 <- lm(callback ~ crimrec + black, data = dat)
