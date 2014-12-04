##
# Descriptive stats and plots of the data set

library(ggplot2)
library(plyr)

# distribution of accounts per salesperson
accountsPerSalesperson <- function(data) {
  
  d <- ddply(data[data$covered_by!="Unclear",], c("salesperson_id", "covered_by"), summarise, numAccounts = length(unique(customer_number)))
  
  print(nrow(d))
  
  g <- ggplot(d[d$numAccounts<100,]) +
    geom_histogram(aes(numAccounts, group=covered_by, fill=covered_by),
                   position = "dodge",
                   binwidth=10) +
    ylab("Number of salespersons") +
    xlab("Number of accounts managed")
  g
}


# divisions per salesperson
divsPerSalesperson <- function(data) {
  
  d <- ddply(data, "salesperson_id", summarise, numDivisions = length(unique(division)))
  
  table(d$numDivisions)
  # only one salesperson works across divisions.
}


areaPerSalesperson <- function(data) {
  plotAreaPerSalespersonData(computeAreaPerSalespersonData(data))
}

computeAreaPerSalespersonData <- function(data) {
  ddply(data, c("salesperson_id", "covered_by"), summarise, areacovered = computeArea(latitude, longitude))
}

plotAreaPerSalespersonData <- function(d, cutoff=5000) {
  g <- ggplot(d[d$areacovered<cutoff,]) +
    geom_histogram(aes(areacovered, group=covered_by, fill=covered_by),
                   position = "dodge",
                   binwidth=2) +
    ylab("Number of salespersons") +
    xlab("Area covered by accounts (average of pairwise distances)")
  g
}


localAndNationalAccounts <- function(data) {
  
  table(data$business_type)
}

localNationalAccountVsSalespersonType <- function(data) {
  with(data, table(business_type, covered_by))
}

businessSegmentVsSalespersonType <- function(data) {
  with(data, table(segment, covered_by))
}