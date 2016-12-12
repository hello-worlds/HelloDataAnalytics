library(dismo)

mymap <- gmap("France")  # choose whatever country
plot(mymap)

mymap <- gmap("France", type = "satellite")
plot(mymap)

mymap <- gmap("France", type = "satellite", exp = 3)
plot(mymap)

mymap <- gmap("France", type = "satellite", filename = "France.gmap")

mymap <- gmap("Europe")
plot(mymap)
select.area <- drawExtent()
# now click 2 times on the map to select your region
mymap <- gmap(select.area)
plot(mymap)
# See ?gmap for many other possibilities