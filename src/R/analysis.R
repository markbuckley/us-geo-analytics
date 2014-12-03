

# Step 1: find potential candidates
potentialCandidates <- 
  data[ data$covered_by == "Street Team" &
        data$business_type == "NM" &
        data$segment != "NCH" , ]

print (paste0("There are ", nrow(potentialCandidates), " candidates."))

# Step 2: identify remote cases