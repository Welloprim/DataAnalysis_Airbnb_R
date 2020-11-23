listings <- read.csv("~/Documents/Data_IA/R /airbnb_Paris/listings.csv")
#Preprocessing
new_listing = subset(listings, select = -c(neighbourhood_group) )
subset(new_listing, !is.na(price))
new_listing <- new_listing[!rowSums(new_listing[9] < 8),]
#Bien localiser à Paris
paris <- new_listing %>% filter(str_detect(street, "Paris"))
#True verification, Si un seul pas signe de sureté
coma <- paris %>% filter(str_detect(host_verifications, ","))

from_hood <- group_by(new_listing, neighbourhood)
summarise(from_hood)
summarise(group_by(listings, neighbourhood))