
library(ggplot2)
library(maps)
library(ggmap)

mapAccountLocations <- function(data, usegooglemaps=F, keepTheseStates = c(
  "florida",
  "georgia",
  "alabama",
  "mississippi",
  "louisiana",
  "arkansas",
  "tennessee",
  "north carolina",
  "south carolina")) {
    
  # draw the map
  if (usegooglemaps) {
    centerLat <- mean(data$latitude)
    centerLon <- mean(data$longitude)
    
    g <- ggmap(get_googlemap(center = c(lon = centerLon, lat = centerLat), zoom=5))
  } else { # use maps
    mData <- map_data("state", boundary = FALSE, interior=T)
    mData <- mData[ mData$region %in% keepTheseStates,]
    
    g <- ggplot() + 
             geom_polygon(data=mData,aes(x=long, y=lat,group=group), fill=NA,colour="black")
             #scale_y_continuous(breaks=seq(-80,80,by=20))
  }
    g +
      # add the data points
      geom_point(data=data, aes(longitude,latitude), colour="red")
}


highlightPoints <- function(g, data, pointRows, col) {
  g +
    geom_point(data=data[pointRows,], aes(longitude,latitude), colour=col, size=3)
}
