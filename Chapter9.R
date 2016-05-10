#####################################
#   Chapter 9 - Control Statements  #
#   May 10th 2016                   #
#####################################

# 9.1 - if and else

as.numeric(TRUE)
as.numeric(FALSE)

1 == 1 # TRUE
1 < 1 # FALSE
1 <= 1 # TRUE
1 > 1 # FALSE
1 >= 1 # TRUE
1 != 1 # FALSE

# set up a variable to hold 1
toCheck <- 1

# if toCheck is equal to 1, print hello
if(toCheck == 1)
{ 
    print("Hello")
}

if(toCheck == 0)
{
    print("hello")
} # prints nothing

# first create the function
check.bool <- function(x)
{
    if (x == 1)
    {
        # if the input is equal to 1, print hello
        print("hello")
    }
    else 
    {
        print("goodbye")
    }
}

check.bool(1)
check.bool(0)
check.bool("k")
check.bool(TRUE)

check.bool <- function(x)
{
    if (x == 1)
    {
        # if the input is equal to 1, print hello
        print("hello")
    } else if (x == 0)
    {
        print("goodbye")
    } else
    {
        print("confused")
    }
}

check.bool(1)
check.bool(0)
check.bool("k")
check.bool(TRUE)

# 9.2 - switch

use.switch <- function(x)
{
    switch(x, 
           "a" = "first",
           "b" = "second",
           "z" = "last",
           "c" = "third",
           "other")
}

use.switch("a")
use.switch("b")
use.switch("c")
use.switch("d")
use.switch("e")
use.switch("z")

use.switch(1)
use.switch(2)
use.switch(3)
use.switch(4)
use.switch(5)
use.switch(6) # nothing is returned
is.null(use.switch(6)) # TRUE

# ifelse
# see if 1 == 1
ifelse(1 == 1, "Yes", "No")

# see if 1 == 0 
ifelse(1 == 0, "Yes", "No")

toTest <- c(1, 1, 0, 1, 0, 1)
ifelse(toTest ==1, "Yes", "No")

ifelse(toTest == 1, toTest * 3, toTest)
ifelse(toTest == 1, toTest * 3, "Zero")

toTest[2] <- NA
ifelse(toTest == 1, "Yes", "No")
ifelse(toTest == 1, toTest * 3, toTest)
ifelse(toTest == 1, toTest * 3, "Zero")

# 9.4 Compound Tests
a <- c(1, 1, 0, 1)
b <- c(2, 1, 0, 1)

# this checks each element of a and each element of b
ifelse(a == 1 & b ==1, "Yes", "No")

# this only check the first element of a and the first ellement of b,
# returning only one result
ifelse(a == 1 && b == 1, "Yes", "No")
