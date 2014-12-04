
# cluster within groups

clusterLocations <- function(data) {
  distances <- dist(data[, c("latitude", "longitude")])
  
  clusters <- hclust(distances, "single")
  
  clusters
}