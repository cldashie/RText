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

# 6.3 - Reading from Databases
install.packages("RODBC") # First install failed - had to use BREW in the the terminal window
require(RODBC) 

# Create a DSN
db <- odbcConnect("QV Training")

# 6.4 Data from other Statistical Tools
read.spss   # SPSS
read.dta    # Stata
read.ssd    # SAS
read.octave # Octave
read.mtp    # Minitab
read.systat # Systat

# 6.5 - R Binary Files

# Save the tomato data.frame to disk
save(tomato, file = "tomato.rdata")
# Remove tomato from memory (not from the disk)
rm(tomato)
# Check if it still exists
head(tomato)
# Read from the disk
load("tomato.rdata")
# Check if it exists
head(tomato)

# Create some objects
n <- 20
r <- 1:10
w <- data.frame(n,r)
# check them out
n
r
w
# save them
save(n,r,w, file = "multiple.rdata")
# remove them
rm(n,r,w)
n
r
w
# Load them back
load("multiple.rdata") # In this case we are saving and loading from the working directory
# Can check the working directory with getwd() and change with setwd()
n
r
w

# 6.6 - Data included with R
require(ggplot2)
data(diamonds)
head(diamonds)

# To find a list of available data, type data() into the console
data()

# 6.7 Extract Data from Web Sites

# Simple HTML Tables
install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
    # the which argument lets you decide which table to read if there is more than one
bowlPool


