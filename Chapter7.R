######################################
#   Chapter 7: Statistical Graphics  #
#   May 5th, 2016                    #
######################################
library(ggplot2)

# 7.1 - Base Graphics
data(diamonds)
head(diamonds)

# Histograms
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat")

# Base Scatterplot
plot(price ~ carat, data = diamonds)
plot(diamonds$carat, diamonds$price)

# Boxplots
boxplot(diamonds$carat)

# 7.2 - ggplot2
# Histrograms and Densities
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")

# Scatterplots
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

# Save the basics of ggplot object to a variable
g <- ggplot(diamonds, aes(x = carat, y = price))
g + geom_point(aes(color = color))

g + geom_point(aes(color = color)) + facet_wrap(~color)
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

# Boxplots and Violins Plots
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

# Adding Layers to the Violin Plot
ggplot(diamonds, aes(y = carat, x = cut)) + geom_point() + geom_violin()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() + geom_point() 

# Line Graphs
ggplot(economics, aes(x = date, y = pop)) + geom_line()

# Load the lubridate package
install.packages("lubridate")
require(lubridate)

## Create the year and month variables
economics$year <- year(economics$date)
# the label argument to month means that the result should be the 
# names of the month instead of the number
economics$month <- month(economics$date, label=TRUE)

# subset the data
# the which function returns the indices of observations where the
# tested condition was TRUE
econ2000 <- economics[which(economics$year >= 2000), ]

# load the scales package for better axis formatting
require(scales)

# build the foundations of the plot
g <- ggplot(econ2000, aes(x=month, y=pop))
# add lines color coded and group by year
# the group aesthetic breaks the data into separate groups
g <- g + geom_line(aes(color=factor(year), group=year))
# name the legend "Year"
g <- g + scale_color_discrete(name="Year")
# format the y axis
g <- g + scale_y_continuous(labels=comma)
# add a title and axis labels
g <- g + labs(title="Population Growth", x="Month", y="Population")
# plot the graph
g

# Themes
install.packages("ggthemes")
require(ggthemes)
# build a plot and store it in g2
g2 <- ggplot(diamonds, aes(x = carat, y = price)) +
    geom_point(aes(color=color))

# apply a few themes
g2 + theme_economist() + scale_colour_economist()
g2 + theme_excel() + scale_colour_excel()
g2 + theme_tufte()
g2 + theme_wsj()


