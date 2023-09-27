# R cheat sheet and examples

num_vec <- c(3,6,3,8)
spp_vec <- c("spp1", "spp3", "spp2", "spp3")
dataframe <-  data.frame(num_vec, spp_vec)
data(trees)
tree_data <- trees
tree_data$light <- c(rep(c("shade", "sun"), each=15), "sun")
tree_data$light <- as.factor(tree_data$light)
my_matrix <- as.matrix(dataframe)

c() 
# create vector

sum()
# add

length()
# gives length of the vector or # of columns in a dataframe

unique()
# gives how many unique elements in a vector

as.numeric()
# coerce vector to numeric values (will introduce NAs if values not numeric)

log()
# extracts a natural log value of a vector

sort()
# arrange by value or letter in counting or alphabetical order

is.na()
# gives if vector is NA or not

# !____()
# ! in front of a function will do the inverse

# %in%
# gives what elements in a '2nd specified vector' are found in '1st specified vector'
# ex. '1st specified vector' %in% '2nd specified vector'
  
#install.packages(lubridate)
  library(lubridate)

my_date <- ymd("2023/september, 27")
# create my_date object in environment consisting of 'ymd' formatted date

seq(from = 0, to = 10, by = .5)
# create vector of values that increment at a regular rate

rep(x = 1:3, times = 2)
# creates a vector with a repeating 'set' of values

rep(x = 1:3, each = 2)
# creates a vector with 'each' element repeated 

grepl("3", spp_vec)
# gives which elements of a character vector contain a particular string of text

dataframe[grepl("3", spp_vec),]

write.csv(dataframe, "dataframe.csv", row.names = F)
# create .csv file from vector with the name in ""

getwd()
# get working directory

dataframe_uploaded <- read.csv("dataframe.csv")
# load data from .csv file

setwd()
# set working directory

my_func <- function(x) {
  x_mod <- (x + 5) * 3
  return(x_mod)
} # creates a function that takes vector 'x' applies 'x_mod' and returns 'x_mod'
my_func(x = num_vec)

help()
# opens help page for inserted function/data
# ex. help(grepl)

data()
# extracts data from named data set

### Side 2: