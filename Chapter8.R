#####################################
#   Chapter 8: Writing R Functions  #
#   May 7th 2016                    #
#####################################

# 8.1 - Hello, World!

say.hello <- function()
{
    print("Hello, World!")
}

say.hello()

# 8.2 Function Arguments

# One substitution
sprintf("Hello %s", "Jared")

# Two substituions
sprintf("Hello %s, today is %s", "Jared", "Sunday")

# New Function - One Argument
hello.person <- function(name)
{
    print(sprintf("Hello %s", name))
}

hello.person("Jared")

hello.person("Bob")

hello.person("Sarah")

# Two Arguments
hello.person <- function(first, last)
{ 
    print(sprintf("Hello %s %s", first, last))
}

# By position
hello.person("Jared", "Lander")

# By name
hello.person(first = "Jared", last = "Lander")

# The other order
hello.person(last = "Lander", first = "Jared")

# Just specify one name
hello.person("Jared", last = "Lander")

# Specify the other
hello.person(first = "Jared", "Lander")

# Specify the second argument first then provide the first argument with no name
hello.person(last = "Lander", "Jared")

# Partial argument names
hello.person(fir = "Jared", l = "Lander")

# Default Arguments
# Using "Doe" as the default last name
hello.person <- function(first, last = "Doe")
{
    print(sprintf("Hello %s %s", first, last))
}

# call without specifying last
hello.person("Jared")

# call with a different last name
hello.person("Jared", "Lander")

# Extra arguments
hello.person("Jared", extra="Goodbye")

# Call it without two valid arguments and a third
hello.person("Jared", "Lander", "Goodbye")

# now build hello.person so that it absorbs extra arguments
hello.person <- function(first, last = "Doe", ...)
{ 
    print(sprintf("Hello %s %s", first, last))
}

# call hello with an extra argument
hello.person("Jared", extra = "Goodbye")

# call it with two valid arguments and a third
hello.person("Jared", "Lander", "Goodbye")

# 8.3 - Return Values

# first build it without an explicit return
double.num <- function(x)
{
    x*2
}

double.num(5)

# now build it with an explicit return
double.num <- function(x)
{
    return(x * 2)
    
    #below here is not executed because the function already exited
    print("Hello!")
    return(17)
}

double.num(5)

# 8.4 - do.call
# This allows us to specify the name of a function either as a character or as an object,
# and provide arguments as a list
do.call("hello.person", args = list(first = "Jared", last = "Lander"))
do.call(hello.person, args=list(first = "Jared", last="Lander"))

run.this <- function(x, func = mean)
{
    do.call(func, args = list(x))
}

run.this(1:10)

# specify to calulate the mean
run.this(1:10, mean)

# calculate the sum
run.this(1:10, sum)

# calculate the standard deviation
run.this(1:10, sd)

# Functions allow us to create reusable code that avoids repetition and 
# allows easy modification. Important points to remember are function arguments, 
# default values, and returned values.