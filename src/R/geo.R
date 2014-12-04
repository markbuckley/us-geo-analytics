# geo stuff

# computes the sum of pairwise distances 
# skips very large lists to save time (returns Inf)
computeArea <- function(latitude, longitude) {
  
  if (length(latitude)>100) {
    Inf
  } else if (length(latitude) == 1) {
    0
  } else {
  
  # create a list of two-item lists, ie points
  points <- Map(function(a,b) {c(a,b)}, latitude, longitude)
  
  allCombinations <- combn(points, 2)
  
  pointPairs <- as.data.frame(t(allCombinations))
  
  mean(distance(pointPairs$V1, pointPairs$V2))
  }
}

# Euclidean distance
distance <- Vectorize(function(x1, x2) {
  dist(rbind(x1, x2))[1]
}, c("x1", "x2"))
