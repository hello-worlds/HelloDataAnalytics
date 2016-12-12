library(googleVis)

data(Exports)    # a simple data frame
Geo <- gvisGeoMap(Exports, locationvar="Country", numvar="Profit", 
                  options=list(height=400, dataMode='regions'))
plot(Geo)

data(Andrew)
M1 <- gvisMap(Andrew, "LatLong", "Tip", 
              options=list(showTip=TRUE, showLine=F, enableScrollWheel=TRUE, 
                           mapType='satellite', useMapTypeControl=TRUE, width=800,height=400))
plot(M1)