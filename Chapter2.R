# Chapter 5: Advanced Data Structures

# Creating a Dataframe
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", 
       "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(x, y, q)
theDF

# Assigning names to the data frame
theDF <- data.frame( First = x, Second = y, Sport = q)
theDF

# Checking the attributes of a data frame
nrow(theDF)
ncol(theDF)
dim(theDF)

# Checking the names of a data frame
