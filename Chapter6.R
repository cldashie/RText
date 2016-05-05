#####################################
#   Chapter 6: Reading Data into R  #
#   May 4th, 2016                   #
#####################################

# 6.1 - Reading CSVs 
theUrl <- "http://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table (file = theUrl, header = TRUE, sep = ",")

head(tomato)

# One helpful argument is stringsAsFactors. Setting this as 
# false prevents character columns from being converted to factor 
# columns which saves computation time. It can also be used in data.frames.
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse",
       "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(Frist=x, Second=y, Sport=q, stringsAsFactors = FALSE)
theDF$Sport
