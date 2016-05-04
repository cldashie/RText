#####################################
#   Chapter 6: Reading Data into R  #
#   May 4th, 2016                   #
#####################################

# 6.1 - Reading CSVs 
theUrl <- "http://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table (file = theUrl, header = TRUE, sep = ",")

head(tomato)
