#################################################
#   Chapter 10 - Loops the Un-R Way to Iterate  #
#   May 17th, 2016                              #
#################################################

# 10.1 - for Loops

# For loops iterate over an index that is provided as a vector and performs some operations

for (i in 1:10)
{
    print(i)
}

print(1:10)

# build a vector holding fruit names
fruit <- c("apple", "banana", "pomegranate")
# make a variable to hold their lengths, with all NA to start
fruitLength <- rep(NA, length(fruit))
fruitLength
# give is names
names(fruitLength) <- fruit
fruitLength
# loop through the fruit assigning their lengths to the result vector
for (a in fruit)
{
    fruitLength[a] <- nchar(a)
}
# show the lengths
fruitLength

# Using R vectorization instead of a loop
fruitLength2 <- nchar(fruit)
names(fruitLength2) <- fruit
fruitLength2

identical(fruitLength, fruitLength2)

# 10.2 - while Loops
x <- 1
while (x <= 5)
{
    print(x)
    x <- x + 1
}

# 10.3 - Controlling Loops
for (i in 1:10)
{
    if (i == 3) # this loop skips 3
    {
        next
    }
    print(i)
}

for (i in 1:10)
{
    if (i == 4)
    {
        break
    }
    print(i)
}