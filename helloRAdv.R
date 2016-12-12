# Get and print current working directory.
print(getwd())

# Set current working directory.
# setwd("/web/com")

data <- read.csv('data ga jkt-sby/PKGAF_abd8e10.csv')
print(data)

print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
print(class(data))
print(summary(data))
print(head(data))
print(dim(data))
print(matrix(data))

print(data$Speed)
print(is.data.frame(data$Speed))
print(ncol(data$Speed))
print(nrow(data$Speed))
print(class(data$Speed))
print(summary(data$Speed))
print(head(data$Speed))
print(dim(data$Speed))
print(matrix(data$Speed)) # konversi ke matrix

# Get the max salary from data frame.
speed <- max(data$Speed)
print(speed)

# PENTING
# Get the person detail having max salary.
retval <- subset(data, Speed == max(Speed))
print(retval)

# PENTING
retval <- subset( data, Speed == 241)
print(retval)

info <- subset(data, Speed == 241 & Direction == 301)
print(info)

data <- read.csv("input.csv")
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)


# Write filtered data into a new file.
write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

# Write filtered data into a new file.
write.csv(retval,"output.csv", row.names = FALSE)
newdata <- read.csv("output.csv")
print(newdata)


# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Print the result.
print(result)


# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

# Print the result.
print(rootsize)

# Print the result.
print(rootnode[1])


# Get the first element of the first node.
print(rootnode[[1]][[1]])

# Get the fifth element of the first node.
print(rootnode[[1]][[5]])

# Get the second element of the third node.
print(rootnode[[3]][[2]])


# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)



# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "input.json")

# Print the result.
print(result)


# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)





# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_last5min")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")