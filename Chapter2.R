#######################################
# Chapter 5: Advanced Data Structures #
# May 5th, 2015                       #
#######################################

#------------------------------#
#    Section 1: Data Frames    #
#------------------------------#

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
names(theDF)
names(theDF)[3] # Gives a specific column name

rownames(theDF)
# We can rename the rows
rownames(theDF) <- c("One", "Two", "Three", "Four", "Five", "Six", 
                     "Seven", "Eight", "Nine", "Ten")
rownames(theDF)

# We can reset the row names with the following command
rownames(theDF) <- NULL
rownames(theDF)

head(theDF) # only shows the first few rows
head(theDF, n = 7) # shows the first "n" rows

tail(theDF) # Shows last 5 rows

class(theDF) # tells you the class

# Since each column is a vector, it can be accessed individuall and have its own class
theDF$Sport # Prints out the sport column

# Specify an element of the dataframe
theDF[3,2] # First is the row number, second is the column number
theDF[3, 2:3] # Specifies more than one column

theDF[c(3,5), 2] # rows 3 and 5, column 2 - returned as a vector (so no column names)
theDF[c(3,5), 2:3]
theDF[ ,3] # Prints the whole column 3
theDF[ ,c("First", "Sport")] # Accesses multiple columns by name using a character vector with the names
theDF[ ,"Sport"] # Don't have to use a character vector because its only one column

#-------------------------#
#   Section 5.2: Lists    #
#-------------------------#

# Lists can contain all numberics, or characters, or a mix of the two (or other lists)

# Creates a 3 element list
list(1, 2, 3)
# Creates a single element list where the only element is a vector with 3 elements
list(c(1,2,3))
# Creates a two element list of vectors
list3 <- list(c(1,2,3),3:7)
list3
# Creates a two element list of a data frame and a vector
list(theDF,1:10)
# Three elements: data.frame, vector, and a list holding two vectors
list5 <- list(theDF, 1:10, list3)
list5

names(list5) # No names by default
names(list5) <- c("data.frame", "vector", "list") # Assigning names to the elements of the list
names(list5)
list5

# Names can also be assigned to list eleemnts during the creation using name-value pairs
list6 <- list(TheDataFrame = theDF, TheVector = 1:10, TheList = list3)
names(list6)
list6

# It is possible to append elements to a list simply by using an index that does not exist
length(list5) # See how long the list is currently
list5[[4]] <- 2
length(list5)

list5[["NewElement"]] <- 3:6
length(list5)
names(list5)
list5

#-------------------------------#
#    Section 5.3: Matrices      #
#-------------------------------#

# Every single element must be the same type (most often numeric)

# Create 5x2 matrix
A <- matrix(1:10, nrow=5)
B <- matrix(21:30, nrow=5)
C <- matrix(21:40, nrow=2)

# Checking the dimensions
nrow(A)
ncol(A)
dim(A)

# Add them
A + B

# Multipling the elements of the matrix (NOT MATRIX MULTIPLICATION)
A * B

# See if the elements are equal
A == B

# Performing Matrix Multiplication
A %*% t(B) # Had to transpose B so can multiply the matrices

# Matrices are similar to data frames in that the rows and columns can have names
colnames(A)
rownames(A)

colnames(A) <- c("Left", "Right")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")
A

colnames(B) <- c("First", "Second")
rownames(B) <- c("One", "Two", "Three", "Four", "Five")

colnames(C) <- LETTERS[1:10]
rownames(C) <- c("Top", "Bottom")

t(A)
A %*% C # Keeps the row names from the left matrix and column names from the right

# There are two special vectors, letters and LETTERS that contain the 
    # lower-case and upper-case letters
columnames(C)

#-------------------------#
#   Section 5.4: Arrays   #
#-------------------------#

# An array is a multidimensional vector. It must all be of the same type and individual 
# elements are accessed in a similar fashion using square brackets. The first element is 
# the row index, the second is the column index, and the remaining elements are 
# for outer dimensions.

theArray <- array(1:12, dim = c(2,3,2))
theArray
theArray[1,  ,  ]
theArray[ , 1,  ]

# The main difference between an array and a matrix is that matrices are restricted
# to two dimensions and arrays can have an arbitrary number.