flight <- read.csv('data ga jkt-sby/PKGAF_abd8e10.csv')

i <- sapply(flight, is.factor)
flight[i] <- lapply(flight[i], as.character)

for (i in 1:nrow(flight)) {
  print(flight["Position"][i,1])
}

#create lat long different col
latlong=matrix(0,nrow(flight),2)

for (i in 1:nrow(flight)) {
  latlong[i,]=unlist(strsplit(flight["Position"][1,1],","))
}