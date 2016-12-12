# load data json
# gagal

# require(jsonlite)
# fromJSON('flight-log-20151120.json')
# 
# hi=stream_in('flight-log-20151120.json')
# 
# tmp <- tempfile()
# download.file("http://jsonstudio.com/wp-content/uploads/2014/02/companies.zip", tmp)
# companies <- stream_in(unz(tmp, "companies.json"))
# tmp <- file.access('flight.log.20151121.json')
# companies <- stream_in(unz(tmp, "companies.json"))


#load data csv
data = read.csv("flight100row_new.csv")