library(dismo)  # check also the nice 'rgbif' package! 
laurus <- gbif("Laurus", "nobilis")

# get data frame with spatial coordinates (points)
locs <- subset(laurus, select = c("country", "lat", "lon"))
head(locs)  # a simple data frame with coordinates

# Discard data with errors in coordinates:
locs <- subset(locs, locs$lat < 90)


# Making data 'spatial'
coordinates(locs) <- c("lon", "lat")  # set spatial coordinates
plot(locs)


# Define spatial projection
crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")  # geographical, datum WGS84
proj4string(locs) <- crs.geo  # define projection system of our data
summary(locs)

# Quickly plotting point data on a map
plot(locs, pch = 20, col = "steelblue")
library(rworldmap)
# library rworldmap provides different types of global maps, e.g:
data(coastsCoarse)
data(countriesLow)
plot(coastsCoarse, add = T)

# Subsetting and mapping again
table(locs$country)  # see localities of Laurus nobilis by country

locs.gb <- subset(locs, locs$country == "United Kingdom")  # select only locs in UK
plot(locs.gb, pch = 20, cex = 2, col = "steelblue")
title("Laurus nobilis occurrences in UK")
plot(countriesLow, add = T)

summary(locs.gb)


# Mapping vectorial data (points, polygons, polylines)
# Mapping vectorial data using gmap from dismo
gbmap <- gmap(locs.gb, type = "satellite")
locs.gb.merc <- Mercator(locs.gb)  # Google Maps are in Mercator projection. 
# This function projects the points to that projection to enable mapping
plot(gbmap)

points(locs.gb.merc, pch = 20, col = "red")


# Mapping vectorial data with RgoogleMaps
require(RgoogleMaps)

locs.gb.coords <- as.data.frame(coordinates(locs.gb))  # retrieves coordinates 
# (1st column for longitude, 2nd column for latitude)
PlotOnStaticMap(lat = locs.gb.coords$lat, lon = locs.gb.coords$lon, zoom = 5, 
                cex = 1.4, pch = 19, col = "red", FUN = points, add = F)

map.lim <- qbbox(locs.gb.coords$lat, locs.gb.coords$lon, TYPE = "all")  # define region 
# of interest (bounding box)
mymap <- GetMap.bbox(map.lim$lonR, map.lim$latR, destfile = "gmap.png", maptype = "satellite")

# see the file in the wd
PlotOnStaticMap(mymap, lat = locs.gb.coords$lat, lon = locs.gb.coords$lon, zoom = NULL, 
                cex = 1.3, pch = 19, col = "red", FUN = points, add = F)

mymap <- GetMap.bbox(map.lim$lonR, map.lim$latR, destfile = "gmap.png", maptype = "hybrid")

PlotOnStaticMap(mymap, lat = locs.gb.coords$lat, lon = locs.gb.coords$lon, zoom = NULL, 
                cex = 1.3, pch = 19, col = "red", FUN = points, add = F)

# Map vectorial data with googleVis (internet)
points.gb <- as.data.frame(locs.gb)
points.gb$latlon <- paste(points.gb$lat, points.gb$lon, sep=":")
map.gb <- gvisMap(points.gb, locationvar="latlon", tipvar="country", 
                  options = list(showTip=T, showLine=F, enableScrollWheel=TRUE,
                                 useMapTypeControl=T, width=1400,height=800))
plot(map.gb)

# Drawing polygons and polylines (e.g. for digitising)
plot(gbmap)
mypolygon <- drawPoly()  # click on the map to draw a polygon and press ESC when finished
summary(mypolygon)  # now you have a spatial polygon! Easy, isn't it?

# Converting between formats, reading in, and saving spatial vector data
# Exporting KML (Google Earth)
library(rdgal)
writeOGR(locs.gb, dsn = "locsgb.kml", layer = "locs.gb", driver = "KML")
 
# Reading KML
newmap <- readOGR("locsgb.kml", layer = "locs.gb")

# Save as shapefile
writePointsShape(locs.gb, "locsgb")

# Reading shapefiles
gb.shape <- readShapePoints("locsgb.shp")
plot(gb.shape)

# Changing projection of spatial vector data
# Projecting point dataset
summary(locs)

crs.laea <- CRS("+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +units=m +no_defs")  # Lambert Azimuthal Equal Area
locs.laea <- spTransform(locs, crs.laea)  # spTransform makes the projection

# Projecting shapefile of countries
plot(countriesLow)  # countries map in geographical projection

country.laea <- spTransform(countriesLow, crs.laea)  # project

plot(locs.laea, pch = 20, col = "steelblue")
plot(country.laea, add = T)

# define spatial limits for plotting
plot(locs.laea, pch = 20, col = "steelblue", xlim = c(1800000, 3900000), ylim = c(1e+06, 
                                                                                  3e+06))
plot(country.laea, add = T)

# 4. kebanyakan nyobanya