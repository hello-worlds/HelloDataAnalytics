library(rworldmap)

newmap <- getMap(resolution = "coarse")  # different resolutions available
plot(newmap)

mapCountryData()

mapCountryData(mapRegion = "europe")

mapGriddedData()

mapGriddedData(mapRegion = "europe")
