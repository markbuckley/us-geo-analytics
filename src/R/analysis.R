
source("src/R/mapping.R")

# Step 0: do the descriptive stuff

# Step 1: find potential candidates
potentialCandidates <- 
  data[ data$covered_by == "Street Team" &
        data$business_type == "NM" &
        data$segment != "NCH" , ]

print (paste0("There are ", nrow(potentialCandidates), " candidates."))

# map the candidates
#print(mapAccountLocations(potentialCandidates))

# Step 2: identify remote cases