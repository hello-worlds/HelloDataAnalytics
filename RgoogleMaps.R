# error

library(RgoogleMaps)

newmap <- GetMap(center = c(36.7, -5.9), zoom = 10, destfile = "newmap.png", 
                 maptype = "satellite")


# Now using bounding box instead of center coordinates:
newmap2 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap2.png", 
                       maptype = "terrain")


# Try different maptypes
newmap3 <- GetMap.bbox(lonR = c(-5, -6), latR = c(36, 37), destfile = "newmap3.png", 
                       maptype = "satellite")

PlotOnStaticMap(lat = c(36.3, 35.8, 36.4), lon = c(-5.5, -5.6, -5.8), zoom = 10, 
                cex = 4, pch = 19, col = "red", FUN = points, add = F)