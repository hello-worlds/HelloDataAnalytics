library(ff)
library(ffbase)
library(RgoogleMaps)
library(plyr)

addTrans <- function(color,trans)
{
  # This function adds transparancy to a color.
  # Define transparancy with an integer between 0 and 255
  # 0 being fully transparant and 255 being fully visable
  # Works with either color and trans a vector of equal length,
  # or one of the two of length 1.
  
  if (length(color)!=length(trans)&!any(c(length(color),length(trans))==1)) stop("Vector lengths not correct")
  if (length(color)==1 & length(trans)>1) color <- rep(color,length(trans))
  if (length(trans)==1 & length(color)>1) trans <- rep(trans,length(color))
  
  num2hex <- function(x)
  {
    hex <- unlist(strsplit("0123456789ABCDEF",split=""))
    return(paste(hex[(x-x%%16)/16+1],hex[x%%16+1],sep=""))
  }
  rgb <- rbind(col2rgb(color),trans)
  res <- paste("#",apply(apply(rgb,2,num2hex),2,paste,collapse=""),sep="")
  return(res)
}

childcare = read.csv.ffdf(file="child-care.csv", first.rows=500,next.rows=500,colClasses=NA,header=TRUE)
pcodes = read.csv.ffdf(file="zipcodeset.txt", first.rows=50000, next.rows=50000, colClasses=NA, header=FALSE)

childcare$PCODE_R = as.ff(as.factor(sub(" ","", childcare[,"PCODE"])))
names(pcodes) = c("PCODE","Lat","Long","City","Prov")

childcare = merge(childcare, as.ffdf(pcodes[,1:3]), by.x="PCODE_R", by.y="PCODE", all.x=TRUE)

childcare.gc = subset(childcare, !is.na(Lat))
childcare.worship = subset(childcare.gc, bldg_type == "Place of Worship")
childcare.house = subset(childcare.gc, bldg_type == "House")
childcare.community = subset(childcare.gc, bldg_type == "Community/Recreation Centre")
childcare.pschool = subset(childcare.gc, bldg_type == "Public Elementary School")
childcare.highrise = subset(childcare.gc, bldg_type == "High Rise Apartment")
childcare.purpose = subset(childcare.gc, bldg_type == "Purpose Built")

Fn = ecdf(childcare.worship[,"TOTSPACE"])
childcare.worship$TOTSPACE.pct = as.ff(Fn(childcare.worship[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.worship[,"Lat"], lon=childcare.worship[,"Long"])
PlotOnStaticMap(mymap, childcare.worship[,"Lat"], childcare.worship[,"Long"], cex=childcare.worship[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))

Fn = ecdf(childcare.house[,"TOTSPACE"])
childcare.house$TOTSPACE.pct = as.ff(Fn(childcare.house[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.house[,"Lat"], lon=childcare.house[,"Long"])
PlotOnStaticMap(mymap, childcare.house[,"Lat"], childcare.house[,"Long"], cex=childcare.house[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))


Fn = ecdf(childcare.community[,"TOTSPACE"])
childcare.community$TOTSPACE.pct = as.ff(Fn(childcare.community[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.community[,"Lat"], lon=childcare.community[,"Long"])
PlotOnStaticMap(mymap, childcare.community[,"Lat"], childcare.community[,"Long"], cex=childcare.community[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))

Fn = ecdf(childcare.pschool[,"TOTSPACE"])
childcare.pschool$TOTSPACE.pct = as.ff(Fn(childcare.pschool[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.pschool[,"Lat"], lon=childcare.pschool[,"Long"])
PlotOnStaticMap(mymap, childcare.pschool[,"Lat"], childcare.pschool[,"Long"], cex=childcare.pschool[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))

Fn = ecdf(childcare.highrise[,"TOTSPACE"])
childcare.highrise$TOTSPACE.pct = as.ff(Fn(childcare.highrise[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.highrise[,"Lat"], lon=childcare.highrise[,"Long"])
PlotOnStaticMap(mymap, childcare.highrise[,"Lat"], childcare.highrise[,"Long"], cex=childcare.highrise[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))

Fn = ecdf(childcare.purpose[,"TOTSPACE"])
childcare.purpose$TOTSPACE.pct = as.ff(Fn(childcare.purpose[,"TOTSPACE"]))
mymap = MapBackground(lat=childcare.purpose[,"Lat"], lon=childcare.purpose[,"Long"])
PlotOnStaticMap(mymap, childcare.purpose[,"Lat"], childcare.purpose[,"Long"], cex=childcare.purpose[,"TOTSPACE.pct"]*4, pch=21, bg=addTrans("purple",100))

space.by.bldg_type = ddply(as.data.frame(childcare.gc), .(bldg_type), function (x) c(min.space = min(x[,"TOTSPACE"], na.rm=TRUE), average.space = mean(x[,"TOTSPACE"], na.rm=TRUE), median.space = median(x[,"TOTSPACE"], na.rm=TRUE), max.space = max(x[,"TOTSPACE"], na.rm=TRUE), tot_daycares = sum(!is.na(x[,"TOTSPACE"]))))
space.by.bldg_type = space.by.bldg_type[order(-space.by.bldg_type$tot_daycares),]

bldg_type min.space average.space median.space max.space tot_daycares
18               Public Elementary School        15      74.19355         69.0       217          279
17                       Place of Worship         8      48.46552         44.0       167          116
16                                  Other        14      51.17647         48.5       160          102
1              Catholic Elementary School        16      51.50000         49.5       112           76
9                     High Rise Apartment        20      68.56522         62.0       145           69
22                          Purpose Built        20      72.48276         59.5       165           58
8             Community/Recreation Centre        13      63.73333         60.0       146           45
11                                  House        10      49.84211         44.5       116           38
6                     Commercial Building        16      55.95833         51.5       129           24
15                        Office Building        20      69.69565         64.0       162           23
20                     Public High School        16      42.36842         41.0        60           19
21                 Public School (Closed)        22      70.26667         56.0       180           15
4                                  Church        13      51.90909         46.0       148           11
19      Public Elementary School (French)        36      84.71429         70.0       167            7
23                              Synagogue        24      64.00000         61.0       108            7
7            Community College/University        15      55.16667         59.5        78            6
14                     Low Rise Apartment        15      56.00000         62.0        92            6
2      Catholic Elementary School(French)        39      81.20000         76.0       130            5
5  City owned Community/Recreation Centre        28      65.80000         62.0       103            5
3                    Catholic High School        36      51.50000         54.0        62            4
12                                 HUMSRV        45      52.00000         52.0        59            2
13                    Industrial Building        45     109.00000        109.0       173            2
26              Private Elementary School        20     154.50000        154.5       289            2
10                 Hospital/Health Centre        25      25.00000         25.0        25            1
24                                              109     109.00000        109.0       109            1
25            Coomunity/Recreation Centre       156     156.00000        156.0       156            1
27                   Public Middle School        10      10.00000         10.0        10            1