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

plot(Height ~ Volume, data = tree_data)
# ~ = "is a function of"
# plot(y ~ x, data = )

hist(tree_data$Height)

fitted_model <- lm(Height~ Volume, data = tree_data)
plot(Height ~ Volume, data = tree_data)
# Linear Model formula: Y = a + bX
abline(fitted_model)
abline(v = 40)
abline(h = 85)

### Working with data frames

names(dataframe)
# gives column names
# or to rename column headings
names(dataframe)[1] <- "DBH"

data.frame()

num_vec <- c(3,6,3,8)
spp_vec <- c("spp1", "spp3", "spp2", "spp3")
dataframe <-  data.frame(num_vec, spp_vec)

library(dplyr)
my_tibble <- tibble(num_vec, spp_vec)

my_tree_tibble <- as_tibble(tree_data)

my_matrix <- as.matrix(dataframe)

as.data.frame(my_matrix)

as_tibble()

t(my_matrix)
# transpose columns and rows

ncol(tree_data)
nrow(tree_data)

head(tree_data)

left_join()
# combine 2 data frames based on a reference column

my_tree_tibble$tree_ID <- as.character(1:31)

my_treeleaf_data <-tibble(tree_ID = as.character(1:31), tree_leaves = round(runif(n = 31, min = 3000, max = 5000)))

my_treeleaf_data <- my_treeleaf_data[sample(1:31),]

my_data_all <- left_join(my_tree_tibble, my_treeleaf_data, by = "tree_ID")

my_data_all <- select(my_data_all, -Volume, leaf_number = tree_leaves, DBH = Girth)
# for filtering and renaming columns you want to keep or remove from a data frame

filter(my_data_all, DBH < 11, Height >= 70)
# for filtering and renaming rows you want to keep or remove from a data frame
# , = 'and'
# | = 'or'

mutate(my_data_all, Height_meters = Height * 0.3048,
       Height = Height * 0.05)
# create or modify columns

summarize(my_data_all,
          mean_height = mean(Height),
          max_DBH = max(DBH))
# summarizes all columns in data frame

my_data_grouped <- group_by(my_data_all, light)
# group elements in a column

summarize(group_by(my_data_grouped),
          mean_height = mean(Height),
          max_DBH = max(DBH))

ungroup(my_data_grouped)
# ungroup elements in a column

mod1 <- lm(DBH ~ light + leaf_number, my_data_all)
# linear model function (t-test, regression etc.)

summary(mod1)

mean(num_vec, na.rm = T)
max(my_data_all$Height)
min(my_data_all$Height)
median(my_data_all$Height)
mean(my_data_all$Height)

table(my_data_all$light)
