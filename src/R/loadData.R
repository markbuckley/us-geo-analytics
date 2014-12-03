
loadData <- function(filename) {
  data <- read.csv(filename)
  print(paste0("Loaded ", nrow(data), " rows of data."))
  
  data
}
