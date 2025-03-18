# Exploring RStudio
# Identify and describe the various panes
# RStudio has four main panes:
# 1. Source: Where scripts are written
# 2. Console: Executes R commands
# 3. Environment/History: Shows variables and command history
# 4. Files/Plots/Packages/Help/Viewer: Manages files, plots, packages, and documentation

# Creating and saving a new R script
# Click on File -> New File -> R Script
# Save using File -> Save As

# Executing individual lines: Select and press Ctrl+Enter
# Executing entire script: Click on "Run" or use source("script_name.R")

# Viewing the built-in dataset `mtcars`
data(mtcars)
str(mtcars)
head(mtcars)

# Setting and verifying working directory
setwd("/path/to/your/directory")
getwd()

# Practicing Built-in Functions

# Descriptive statistics
num_vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
mean(num_vector)
median(num_vector)

# Mode function (not built-in)
get_mode <- function(x) {
  unique_x <- unique(x)
  unique_x[which.max(tabulate(match(x, unique_x)))]
}
get_mode(num_vector)

# Generating sequence and summing even numbers
num_seq <- 1:100
sum(num_seq[num_seq %% 2 == 0])

# Concatenating strings
paste("Hello", "World", sep = "-")

# Matrix operations
mat <- matrix(1:9, nrow = 3)
t(mat) # Transpose
det(mat) # Determinant
solve(mat) # Inversion (if invertible)

# Working with Library Packages

# Installing and loading ggplot2
install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = hp)) + geom_point()

# Filtering with dplyr
install.packages("dplyr")
library(dplyr)
filtered_iris <- iris %>% filter(Species == "setosa") %>% arrange(Sepal.Length)
head(filtered_iris)

# Reshaping data with tidyr
install.packages("tidyr")
library(tidyr)
wide_data <- data.frame(ID = 1:3, A = c(10, 20, 30), B = c(40, 50, 60))
long_data <- pivot_longer(wide_data, cols = c(A, B), names_to = "Variable", values_to = "Value")
print(long_data)

# Using data.table
install.packages("data.table")
library(data.table)
dt <- data.table(ID = 1:5, Value = c(10, 20, 30, 40, 50))
dt[, .(Total = sum(Value))]

# Advanced Tasks

# Parsing and formatting dates with lubridate
install.packages("lubridate")
library(lubridate)
date_example <- "2024-03-18"
parsed_date <- ymd(date_example)
print(parsed_date)

# Web scraping with rvest
install.packages("rvest")
library(rvest)
url <- "https://example.com"
webpage <- read_html(url)
titles <- webpage %>% html_nodes("h1") %>% html_text()
print(titles)

# Machine learning with caret
install.packages("caret")
library(caret)
data(iris)
model <- train(Species ~ ., data = iris, method = "rpart")
print(model)

# Time-series visualization with xts and zoo
install.packages(c("xts", "zoo"))
library(xts)
library(zoo)
time_series <- xts(1:10, order.by = Sys.Date() - 10:1)
plot(time_series)